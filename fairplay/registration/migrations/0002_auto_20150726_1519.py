# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='coach',
            name='team',
            field=models.ForeignKey(to='registration.Team', default=1, related_name='coaches'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='gymnast',
            name='team',
            field=models.ForeignKey(to='registration.Team', default=1, related_name='gymnasts'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='gymnast',
            name='tshirt',
            field=models.CharField(null=True, verbose_name='T-Shirt Size', blank=True, choices=[('Extra Small (Youth)', 'Extra Small (Youth)'), ('Small (Youth)', 'Small (Youth)'), ('Medium (Youth)', 'Medium (Youth)'), ('Large (Youth)', 'Large (Youth)'), ('Extra Large (Youth)', 'Extra Large (Youth)'), ('Exra Small (Adult)', 'Exra Small (Adult)'), ('Small (Adult)', 'Small (Adult)'), ('Medium (Adult)', 'Medium (Adult)'), ('Large (Adult)', 'Large (Adult)'), ('Extra Large (Adult)', 'Extra Large (Adult)')], max_length=20),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='team',
            name='gymnast_cost',
            field=models.DecimalField(max_digits=6, default=0, decimal_places=2, verbose_name='Total Gymnast Cost'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='team',
            name='level_cost',
            field=models.DecimalField(max_digits=6, default=0, decimal_places=2, verbose_name='Level Cost'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='team',
            name='per_gymnast_cost',
            field=models.CharField(null=True, verbose_name='Per Gymnast Cost', blank=True, choices=[('80', '$80 per gymnast'), ('90', '$90 per gymnast')], max_length=5),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='team',
            name='total_cost',
            field=models.DecimalField(max_digits=6, default=0, decimal_places=2, verbose_name='Total Registration Cost'),
            preserve_default=True,
        ),
    ]
