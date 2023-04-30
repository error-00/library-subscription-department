from django.contrib import admin
from .models import *


class PublisherAdmin(admin.ModelAdmin):
    pass


class BookAdmin(admin.ModelAdmin):
    pass


class AuthorAdmin(admin.ModelAdmin):
    pass


class BookAuthorAdmin(admin.ModelAdmin):
    pass


class CopiesAdmin(admin.ModelAdmin):
    pass


class ReaderAdmin(admin.ModelAdmin):
    pass


class BooksDeliveryAdmin(admin.ModelAdmin):
    pass


class KnowledgeFieldAdmin(admin.ModelAdmin):
    pass


class KnowledgeFieldHasBookAdmin(admin.ModelAdmin):
    pass


admin.site.register(Publisher, PublisherAdmin)
admin.site.register(Book, BookAdmin)
admin.site.register(Author, AuthorAdmin)
admin.site.register(BookAuthor, BookAuthorAdmin)
admin.site.register(Copies, CopiesAdmin)
admin.site.register(Reader, ReaderAdmin)
admin.site.register(BooksDelivery, BooksDeliveryAdmin)
admin.site.register(KnowledgeField, KnowledgeFieldAdmin)
admin.site.register(KnowledgeFieldHasBook, KnowledgeFieldHasBookAdmin)
