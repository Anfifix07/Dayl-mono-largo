# Generated by Django 4.2.4 on 2023-09-15 16:53

import cliente.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cliente', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='clientes',
            name='casa_apto',
            field=models.CharField(blank=True, help_text='Casa o Apartamento', max_length=10, null=True),
        ),
        migrations.AddField(
            model_name='clientes',
            name='ciudad',
            field=models.CharField(default=1, help_text='Ciudad del cliente', max_length=30),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='clientes',
            name='complemento',
            field=models.CharField(blank=True, help_text='Complemento de dirección', max_length=20, null=True),
        ),
        migrations.AddField(
            model_name='clientes',
            name='contraseña',
            field=models.CharField(default=1, max_length=20, validators=[cliente.models.Cliente.validate_password]),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='clientes',
            name='correo_electronico',
            field=models.EmailField(default=1, help_text='Correo del cliente', max_length=40, unique=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='clientes',
            name='departamento',
            field=models.CharField(choices=[('AMZ', 'Amazonas'), ('ANT', 'Antioquia'), ('ARA', 'Arauca'), ('ATL', 'Atlántico'), ('BOL', 'Bolívar'), ('BOY', 'Boyacá'), ('CAL', 'Caldas'), ('CAQ', 'Caquetá'), ('CAS', 'Casanare'), ('CAU', 'Cauca'), ('CES', 'Cesar'), ('CHO', 'Chocó'), ('COR', 'Córdoba'), ('CUN', 'Cundinamarca'), ('GUA', 'Guainía'), ('GUV', 'Guaviare'), ('HUI', 'Huila'), ('GUA', 'Guajira'), ('MAG', 'Magdalena'), ('MET', 'Meta'), ('NAR', 'Nariño'), ('NDS', 'Norte de Santander'), ('PUT', 'Putumayo'), ('QUI', 'Quindío'), ('RIS', 'Risaralda'), ('SAP', 'San Andrés y Providencia'), ('SAN', 'Santander'), ('SUC', 'Sucre'), ('TOL', 'Tolima'), ('VAC', 'Valle del Cauca'), ('VAU', 'Vaupés'), ('VID', 'Vichada')], default=1, max_length=50),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='clientes',
            name='descripcion',
            field=models.TextField(blank=True, help_text='Descripción adicional', max_length=150, null=True),
        ),
        migrations.AddField(
            model_name='clientes',
            name='nit',
            field=models.CharField(blank=True, help_text='Nit de Cliente', max_length=15, null=True),
        ),
        migrations.AddField(
            model_name='clientes',
            name='nombre',
            field=models.CharField(default=1, help_text='Nombre del cliente', max_length=50),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='clientes',
            name='numero',
            field=models.CharField(default=1, help_text='Número de vía', max_length=10),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='clientes',
            name='telefono',
            field=models.CharField(default=1, help_text='Telefono del cliente', max_length=15),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='clientes',
            name='tipo_persona',
            field=models.CharField(choices=[('Juridica', 'Juridica'), ('Natural', 'Natural')], default=1, help_text='Tipo juridica de Cliente', max_length=50),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='clientes',
            name='tipo_via',
            field=models.CharField(choices=[('CRR', 'Carrera'), ('CLL', 'Calle'), ('AV', 'Avenida'), ('DG', 'Diagonal'), ('TV', 'Transversal')], default=1, help_text='Tipo de vía', max_length=3),
            preserve_default=False,
        ),
    ]
