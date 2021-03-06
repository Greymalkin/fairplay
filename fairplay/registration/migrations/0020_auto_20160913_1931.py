# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-09-13 23:31
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0019_auto_20160912_2234'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='team',
            name='gymnast_cost',
        ),
        migrations.RemoveField(
            model_name='team',
            name='level_cost',
        ),
        migrations.RemoveField(
            model_name='team',
            name='payment_postmark',
        ),
        migrations.RemoveField(
            model_name='team',
            name='per_gymnast_cost',
        ),
        migrations.RemoveField(
            model_name='team',
            name='per_level_cost',
        ),
        migrations.RemoveField(
            model_name='team',
            name='registration_complete',
        ),
        migrations.RemoveField(
            model_name='team',
            name='total_cost',
        ),
        migrations.AlterField(
            model_name='gymnast',
            name='jdo',
            field=models.BooleanField(default=False, help_text='Optionals Levels - JDO, or Compulsory Levels - Division 2', verbose_name='JDO'),
        ),
    ]
