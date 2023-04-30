from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='home'),
    path('search-book', views.search, name='search-book'),
    path('read-tick', views.read_tick, name='read-tick'),
    path('add-tick', views.add_tick, name='add-tick'),
    path('issue-return', views.issue_return, name='issue-return'),
    path('report', views.report, name='report'),
    path('delete-tick/<int:pk>', views.delete_tick, name='delete-tick'),
    path('change-tick/<int:pk>', views.change_tick, name='change-tick'),
    path('issue-book', views.issue, name='issue-book'),
    path('return-book', views.return_book, name='return-book'),
    path('deptors', views.deptors, name='deptors'),
    path('delivery-books', views.del_books, name='del-books'),
]
