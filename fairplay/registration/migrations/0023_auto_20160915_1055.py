# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-09-15 14:55
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0022_auto_20160915_0941'),
    ]

    operations = [
        migrations.RenameField(
            model_name='level',
            old_name='level',
            new_name='name',
        ),
    ]