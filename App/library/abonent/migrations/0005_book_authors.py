# Generated by Django 4.1.7 on 2023-04-01 19:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('abonent', '0004_knowledgefield_reader_copies_bookauthor_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='book',
            name='authors',
            field=models.ManyToManyField(to='abonent.author'),
        ),
    ]
