# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-10-23 13:55
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0048_auto_20171022_1335'),
    ]

    operations = [
        migrations.AlterField(
            model_name='team',
            name='notes',
            field=models.TextField(blank=True, help_text='May be exposed in CSV data exports.', null=True, verbose_name='Public Notes'),
        ),
    ]
