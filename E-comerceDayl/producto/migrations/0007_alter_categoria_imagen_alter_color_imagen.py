# Generated by Django 4.2.4 on 2023-09-17 20:29

from django.db import migrations, models
import producto.models


class Migration(migrations.Migration):

    dependencies = [
        ('producto', '0006_rename_producto_id_color_producto'),
    ]

    operations = [
        migrations.AlterField(
            model_name='categoria',
            name='imagen',
            field=models.ImageField(blank=True, default='imagen/productos/404.png', help_text='Imagen de la categoria', null=True, upload_to=producto.models.nombreImagen),
        ),
        migrations.AlterField(
            model_name='color',
            name='imagen',
            field=models.ImageField(blank=True, default='imagen/productos/404.png', help_text='Imagen del producto', null=True, upload_to=producto.models.nombreImagen),
        ),
    ]
