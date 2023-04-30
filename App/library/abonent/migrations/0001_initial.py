# Generated by Django 4.1.7 on 2023-04-01 18:40

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Publisher',
            fields=[
                ('ID_publisher', models.IntegerField(primary_key=True, serialize=False)),
                ('name_publisher', models.CharField(max_length=45)),
            ],
            options={
                'verbose_name': 'Publisher',
                'db_table': 'publisher',
            },
        ),
    ]
