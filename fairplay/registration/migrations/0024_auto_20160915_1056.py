# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-09-15 14:56
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0023_auto_20160915_1055'),
    ]

    operations = [
        migrations.AddField(
            model_name='level',
            name='level',
            field=models.CharField(default='', max_length=5),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='level',
            name='name',
            field=models.CharField(max_length=20),
        ),
    ]
