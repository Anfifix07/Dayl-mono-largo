# Generated by Django 4.2.4 on 2023-09-15 18:10

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cliente', '0007_cliente_hola'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cliente',
            name='hola',
        ),
    ]
