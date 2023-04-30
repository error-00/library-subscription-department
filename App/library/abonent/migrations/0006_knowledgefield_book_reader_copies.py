# Generated by Django 4.1.7 on 2023-04-01 19:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('abonent', '0005_book_authors'),
    ]

    operations = [
        migrations.AddField(
            model_name='knowledgefield',
            name='book',
            field=models.ManyToManyField(to='abonent.book'),
        ),
        migrations.AddField(
            model_name='reader',
            name='copies',
            field=models.ManyToManyField(to='abonent.copies'),
        ),
    ]
