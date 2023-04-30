from datetime import timedelta, date

from django.db import models
from django.utils import timezone


class Publisher(models.Model):
    ID_publisher = models.IntegerField(primary_key=True)
    name_publisher = models.CharField(max_length=45)

    def __str__(self):
        return self.name_publisher

    class Meta:
        db_table = 'publisher'
        verbose_name = 'Publisher'


class Author(models.Model):
    ID_author = models.IntegerField(primary_key=True)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"

    class Meta:
        db_table = 'author'
        verbose_name = 'Author'


class Book(models.Model):
    ISBN = models.CharField(max_length=20, primary_key=True)
    name = models.CharField(max_length=45)
    public_city = models.CharField(max_length=45)
    year = models.IntegerField()
    page_num = models.IntegerField()
    copies_num = models.IntegerField()
    publisher_ID_publisher = models.ForeignKey(Publisher, on_delete=models.CASCADE)
    authors = models.ManyToManyField(Author, related_name='books', null=True, blank=True)

    def __str__(self):
        return f"{', '.join(author.first_name + ' ' + author.last_name for author in self.authors.all())} - {self.name}"

    class Meta:
        db_table = 'book'
        verbose_name = 'Book'


class BookAuthor(models.Model):
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    author_ID_author = models.ForeignKey(Author, on_delete=models.CASCADE)

    def __str__(self):
        return f'{self.book}'

    class Meta:
        db_table = 'book_has_author'
        verbose_name = 'BooksAuthor'


class Reader(models.Model):
    read_ticket_num = models.AutoField(primary_key=True)
    PIB = models.CharField(max_length=100)
    home_adress = models.CharField(max_length=45)
    tel_work = models.CharField(max_length=10)
    tel_home = models.CharField(max_length=10, null=True, blank=True)
    birth_date = models.DateField()

    def __str__(self):
        return f'{self.read_ticket_num} - {self.PIB}'

    class Meta:
        db_table = 'readers'
        verbose_name = 'Reader'


class Copies(models.Model):
    inventory_num = models.IntegerField(primary_key=True)
    cost = models.DecimalField(max_digits=7, decimal_places=2)
    place = models.IntegerField()
    shelf = models.IntegerField()
    book_ISBN = models.ForeignKey(Book, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.book_ISBN)

    class Meta:
        db_table = 'copies'
        verbose_name = 'Copies'


class BooksDelivery(models.Model):
    readers_read_ticket_num = models.ForeignKey(Reader, on_delete=models.CASCADE)
    copies_inventory_num = models.ForeignKey(Copies, on_delete=models.CASCADE)
    date_issue = models.DateField(default=timezone.now, null=True, blank=True)
    date_return = models.DateField(null=True, blank=True)
    date_must_return = models.DateField(null=True, blank=True)

    class Meta:
        unique_together = ('readers_read_ticket_num', 'copies_inventory_num', 'date_issue')

    def save(self, *args, **kwargs):
        if not self.date_must_return:
            self.date_must_return = self.date_issue + timedelta(days=14)

        if self.pk is None:  # Якщо об'єкт щойно створено (видання книги)
            # Зменшуємо кількість екземплярів книги
            self.copies_inventory_num.book_ISBN.copies_num -= 1
        else:  # Якщо об'єкт вже існує (повернення книги)
            # Збільшуємо кількість екземплярів книги
            self.copies_inventory_num.book_ISBN.copies_num += 1
        self.copies_inventory_num.book_ISBN.save()
        super().save(*args, **kwargs)

    def get_date_issue_from_db(self):
        # Отримуємо дату видачі з БД
        return self.date_issue if self.pk else date.today()  # Якщо запис вже збережено у БД, повертаємо значення з БД, інакше повертаємо поточну дату

    def __str__(self):
        return str(self.copies_inventory_num)


class KnowledgeField(models.Model):
    unique_num = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=45)
    knowledge_field_unique_num = models.ForeignKey('self', on_delete=models.CASCADE)
    book = models.ManyToManyField(Book)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'knowledge_field'
        verbose_name = 'KnowledgeField'


class KnowledgeFieldHasBook(models.Model):
    knowledge_field_unique_num = models.ForeignKey(KnowledgeField, on_delete=models.CASCADE)
    book_ISBN = models.ForeignKey(Book, on_delete=models.CASCADE)

    class Meta:
        db_table = 'knowledge_field_has_book'
        verbose_name = 'KnowledgeFieldHasBook'
        unique_together = ('knowledge_field_unique_num', 'book_ISBN')
