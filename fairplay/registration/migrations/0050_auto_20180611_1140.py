# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2018-06-11 15:40
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0049_auto_20171023_0955'),
    ]

    operations = [
        migrations.AlterField(
            model_name='gymnast',
            name='discipline',
            field=models.CharField(choices=[('mag', 'Mens Artistic'), ('wag', 'Womens Artistic')], default='mag', max_length=20, null=True),
        ),
    ]
