# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-09-21 15:55
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0044_auto_20170921_1110'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='discipline',
            unique_together=set([('name', 'abbr')]),
        ),
    ]
