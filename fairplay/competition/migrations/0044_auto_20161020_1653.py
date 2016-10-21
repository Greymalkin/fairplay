# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-10-20 20:53
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0043_auto_20161014_2333'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='session',
            name='open_warmup_start',
        ),
        migrations.AddField(
            model_name='session',
            name='presentation_start',
            field=models.TimeField(blank=True, null=True, verbose_name='Presentation of Teams Start Time'),
        ),
    ]
