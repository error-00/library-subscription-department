# Generated by Django 4.1.7 on 2023-04-02 12:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('abonent', '0007_alter_book_authors'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='reader',
            name='copies',
        ),
        migrations.AddField(
            model_name='copies',
            name='reader',
            field=models.ManyToManyField(to='abonent.reader'),
        ),
    ]
