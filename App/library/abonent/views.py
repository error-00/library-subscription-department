from django.db.models import Sum, Q
from django.db import IntegrityError
from django.http import HttpResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse

from .forms import *
from .models import *

menu = [
    {'name': 'Головна', 'url_name': 'home'},
    {'name': 'Пошук книг', 'url_name': 'search-book'},
    {'name': 'Читацькі білети', 'url_name': 'read-tick'},
    {'name': 'Видача і повернення', 'url_name': 'issue-return'},
    {'name': 'Звіт', 'url_name': 'report'},
]


def index(request):
    context = {
        'title': 'Бібліотека',
        'menu': menu,
    }
    return render(request, 'abonent/index.html', context=context)


def search(request):
    query = request.GET.get('q')
    sort_by = request.GET.get('sort_by', 'name')  # сортувати за іменем, якщо параметр не вибраний
    sort_order = request.GET.get('sort_order', 'asc')  # за замовчуванням - сортування за зростанням

    if query:
        if query.isdigit():
            books = Book.objects.select_related('publisher_ID_publisher').prefetch_related('authors').filter(
                Q(year__icontains=query) |
                Q(page_num__icontains=query) |
                Q(copies__cost__icontains=query) |
                Q(copies_num__icontains=query)).distinct()  # прибрати дублікати
        else:
            books = Book.objects.select_related('publisher_ID_publisher').prefetch_related('authors').filter(
                Q(name__icontains=query) |
                Q(ISBN__icontains=query) |
                Q(authors__first_name__icontains=query) |
                Q(authors__last_name__icontains=query) |
                Q(public_city__icontains=query) |
                Q(publisher_ID_publisher__name_publisher__icontains=query)).distinct()  # прибрати дублікати
    else:
        books = Book.objects.select_related('publisher_ID_publisher').prefetch_related('authors').all()

    if sort_by:
        if sort_by == 'author':
            books = books.order_by('authors__first_name', 'authors__last_name')
        elif sort_by == 'city':
            books = books.order_by('public_city')
        elif sort_by == 'year':
            books = books.order_by('year')
        elif sort_by == 'pages':
            books = books.order_by('page_num')
        elif sort_by == 'cost':
            books = books.order_by('copies__cost')
        elif sort_by == 'copies':
            books = books.order_by('copies_num')
        else:
            books = books.order_by('name')

    if sort_order == 'desc':
        books = books.reverse()

    context = {
        'title': 'Пошук книг',
        'menu': menu,
        'books': books,
    }
    return render(request, 'abonent/search_books.html', context=context)


def read_tick(request):
    query = request.GET.get('q')
    sort_by = request.GET.get('sort_by', 'name')  # сортувати за іменем, якщо параметр не вибраний
    sort_order = request.GET.get('sort_order', 'asc')  # за замовчуванням - сортування за зростанням

    message = request.GET.get('message', '')

    if query:
        if query.isdigit():
            readers = Reader.objects.filter(
                Q(read_ticket_num__icontains=query) |
                Q(tel_work__icontains=query) |
                Q(tel_home__icontains=query)).distinct()  # прибрати дублікати
        else:
            readers = Reader.objects.filter(
                Q(PIB__icontains=query) |
                Q(home_adress__icontains=query) |
                Q(birth_date__icontains=query)).distinct()  # прибрати дублікати
    else:
        readers = Reader.objects.all()

    if sort_by:
        if sort_by == 'num':
            readers = readers.order_by('read_ticket_num')
        elif sort_by == 'date':
            readers = readers.order_by('birth_date')
        else:
            readers = readers.order_by('PIB')

    if sort_order == 'desc':
        readers = readers.reverse()

    context = {
        'title': 'Читацькі білети',
        'menu': menu,
        'readers': readers,
        'message': message,
    }
    return render(request, 'abonent/read_tick.html', context=context)


def add_tick(request):
    error = None
    if request.method == 'POST':
        form = ReaderForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('read-tick')
        else:
            error = form.errors.get('birth_date')

    form = ReaderForm()
    context = {
        'title': 'Додавання білету',
        'menu': menu,
        'form': form,
        'error': error
    }
    return render(request, 'abonent/add_read_tick.html', context=context)


def delete_tick(request, pk):
    tick = get_object_or_404(Reader, read_ticket_num=pk)

    issued_books = BooksDelivery.objects.filter(readers_read_ticket_num=tick, date_return=None)
    if issued_books.exists():
        message = 'Неможливо видалити читача, у якого є борг!'
        url = reverse('read-tick') + f'?message={message}'
        return redirect(url)
    else:
        tick.delete()
        message = 'Читач успішно видалений!'
        url = reverse('read-tick') + f'?message={message}'
        return redirect(url)


def change_tick(request, pk):
    error = None
    tick = get_object_or_404(Reader, read_ticket_num=pk)
    if request.method == 'POST':
        form = ReaderFormChange(request.POST, instance=tick)
        if form.is_valid():
            form.save()
            return redirect('read-tick')
    else:
        form = ReaderFormChange(instance=tick, initial={
            'PIB': tick.PIB,
            'home_adress': tick.home_adress,
            'tel_work': tick.tel_work,
            'tel_home': tick.tel_home,
            'birth_date': tick.birth_date,
        })

    context = {
        'form': form,
        'tick': tick,
        'tick_pk': pk,
        'error': error,
    }

    return render(request, 'abonent/change_tick.html', context)


def issue_return(request):
    form = BookDeliveryForm()
    message = request.GET.get('message', '')
    context = {
        'title': 'Видача і повернення',
        'menu': menu,
        'form': form,
        'message': message
    }
    return render(request, 'abonent/issue_return.html', context=context)


def issue(request):
    form = BookDeliveryForm()
    message = ''
    readers = Reader.objects.all()
    books = Book.objects.all()
    today = date.today()

    if request.method == 'POST':
        form = BookDeliveryForm(request.POST)
        if form.is_valid():
            selected_reader = form.cleaned_data['readers']
            selected_book = form.cleaned_data['book']
            date_issue = form.cleaned_data['date_issue']
            date_must_return = form.cleaned_data['date_must_return']
            date_return = form.cleaned_data['date_return']
            copies = Copies.objects.filter(book_ISBN=selected_book)

            if BooksDelivery.objects.filter(readers_read_ticket_num=selected_reader,
                                            date_return__isnull=True).count() >= 5:
                message = 'Неможливо видати книгу! У читача вже є 5 книг!'
                context = {
                    'title': 'Видача',
                    'menu': menu,
                    'readers': readers,
                    'books': books,
                    'today': today,
                    'form': form,
                    'message': message,
                }
                return render(request, 'abonent/issue.html', context=context)

            if copies.first().book_ISBN.copies_num == 0:
                message = 'Неможливо видати книгу! Кількість копій книги на складі дорівнює 0!'
                context = {
                    'title': 'Видача',
                    'menu': menu,
                    'readers': readers,
                    'books': books,
                    'today': today,
                    'form': form,
                    'message': message,
                }
                return render(request, 'abonent/issue.html', context=context)

            try:
                book_delivery = BooksDelivery(readers_read_ticket_num=selected_reader,
                                              copies_inventory_num=copies.first(),
                                              date_issue=date_issue, date_return=date_return,
                                              date_must_return=date_must_return)
                book_delivery.save()
                message = 'Книгу успішно видано!'
                url = reverse('issue-return') + f'?message={message}'
                return redirect(url)
            except IntegrityError as e:
                message = 'У читача вже є ця книга на руках!'
                context = {
                    'title': 'Видача',
                    'menu': menu,
                    'readers': readers,
                    'books': books,
                    'today': today,
                    'form': form,
                    'message': message,
                }
                return render(request, 'abonent/issue.html', context=context)

        else:
            form = BookDeliveryForm()

    context = {
        'title': 'Видача',
        'menu': menu,
        'readers': readers,
        'books': books,
        'today': today,
        'form': form,
        'message': message,
    }

    return render(request, 'abonent/issue.html', context=context)


def deptors(request):
    query = request.GET.get('q')
    sort_by = request.GET.get('sort_by', 'readers_read_ticket_num__read_ticket_num')
    sort_order = request.GET.get('sort_order', 'asc')  # за замовчуванням - сортування за зростанням

    if query:
        if query.isdigit():
            issued_books = BooksDelivery.objects.filter(
                Q(copies_inventory_num__book_ISBN__ISBN__icontains=query) |
                Q(copies_inventory_num__book_ISBN__name__icontains=query) |
                Q(readers_read_ticket_num__read_ticket_num__icontains=query)).distinct()  # убрать дубликаты
        else:
            issued_books = BooksDelivery.objects.filter(
                Q(readers_read_ticket_num__PIB__icontains=query) |
                Q(copies_inventory_num__book_ISBN__name__icontains=query) |
                Q(copies_inventory_num__book_ISBN__authors__first_name__icontains=query) |
                Q(copies_inventory_num__book_ISBN__authors__last_name__icontains=query) |
                Q(date_must_return__icontains=query) |
                Q(copies_inventory_num__book_ISBN__ISBN__icontains=query) |
                Q(date_issue__icontains=query)).distinct()
    else:
        issued_books = BooksDelivery.objects.all()

    if sort_by:
        if sort_by == 'reader':
            issued_books = issued_books.order_by('readers_read_ticket_num__PIB')
        elif sort_by == 'book':
            issued_books = issued_books.order_by('copies_inventory_num__book_ISBN')
        elif sort_by == 'date_issue':
            issued_books = issued_books.order_by('date_issue')
        elif sort_by == 'date_must_return':
            issued_books = issued_books.order_by('date_must_return')
        else:
            issued_books = issued_books.order_by('readers_read_ticket_num__read_ticket_num')

    if sort_order == 'desc':
        issued_books = issued_books.reverse()

    context = {
        'title': 'Боржники',
        'menu': menu,
        'issued_books': issued_books
    }

    return render(request, 'abonent/deptors.html', context=context)


def del_books(request):
    issued_books = BooksDelivery.objects.all().distinct()

    context = {
        'title': 'Видані книги',
        'menu': menu,
        'issued_books': issued_books
    }

    return render(request, 'abonent/del_books.html', context=context)


def return_book(request):
    form = BookReturnForm()
    message = ''
    readers = Reader.objects.all()
    books = Book.objects.all()
    today = date.today()

    if request.method == 'POST':
        form = BookReturnForm(request.POST)
        if form.is_valid():
            selected_reader = form.cleaned_data['readers']
            selected_book = form.cleaned_data['book']
            date_return = form.cleaned_data['date_return']
            copies = Copies.objects.filter(book_ISBN=selected_book)

            try:
                book_delivery = BooksDelivery.objects.get(readers_read_ticket_num=selected_reader,
                                                          copies_inventory_num=copies.first())

                # Оновлюємо поля запису
                book_delivery.copies_inventory_num = copies.first()
                book_delivery.date_return = date_return
                book_delivery.save()  # Зберігаємо оновлений запис

                book_delivery.delete()  # Видаляємо запис
                message = 'Книгу успішно повернуто!'
                url = reverse('issue-return') + f'?message={message}'
                return redirect(url)

            except BooksDelivery.DoesNotExist:
                message = 'Запис не знайдено!'  # Обробка помилки, якщо запис не знайдено

        else:
            form = BookReturnForm()

    context = {
        'title': 'Повернення',
        'menu': menu,
        'readers': readers,
        'books': books,
        'today': today,
        'form': form,
        'message': message,
    }

    return render(request, 'abonent/return.html', context=context)


def report(request):
    readers_count = Reader.objects.count()
    books_count = Book.objects.count()
    issued_books_count = BooksDelivery.objects.filter(date_return__isnull=True).count()
    debtors_count = Reader.objects.filter(booksdelivery__isnull=False).distinct().count()
    authors_count = Author.objects.count()
    publishers_count = Publisher.objects.count()
    total_copies_count = Copies.objects.aggregate(Sum('book_ISBN__copies_num'))['book_ISBN__copies_num__sum']

    context = {
        'title': 'Звіт',
        'menu': menu,
        'readers_count': readers_count,
        'books_count': books_count,
        'issued_books_count': issued_books_count,
        'debtors_count': debtors_count,
        'authors_count': authors_count,
        'publishers_count': publishers_count,
        'total_copies_count': total_copies_count
    }
    return render(request, 'abonent/report.html', context=context)
