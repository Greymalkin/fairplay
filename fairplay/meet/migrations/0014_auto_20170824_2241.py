# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-08-25 02:41
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('meet', '0013_auto_20170816_1349'),
    ]

    operations = [
        migrations.AlterField(
            model_name='meet',
            name='all_last_place_ties_in_awards',
            field=models.BooleanField(default=False, help_text='push out award count on tie at last place'),
        ),
    ]
