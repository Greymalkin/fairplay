# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-09-15 13:41
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0021_remove_gymnast_jdo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='gymnast',
            name='age',
            field=models.PositiveSmallIntegerField(blank=True, help_text='Competitive Age (as of 5/31)', null=True, verbose_name='Age'),
        ),
        migrations.AlterField(
            model_name='gymnast',
            name='division',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='athletes', to='competition.Division', verbose_name='Age division'),
        ),
    ]
