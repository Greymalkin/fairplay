# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-10-15 00:13
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0035_auto_20161014_1906'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='scorerankevent',
            name='aa',
        ),
        migrations.RemoveField(
            model_name='scorerankevent',
            name='aa_rank',
        ),
        migrations.RemoveField(
            model_name='scorerankevent',
            name='b_rank',
        ),
        migrations.RemoveField(
            model_name='scorerankevent',
            name='fx_rank',
        ),
        migrations.RemoveField(
            model_name='scorerankevent',
            name='hb_rank',
        ),
        migrations.RemoveField(
            model_name='scorerankevent',
            name='pb_rank',
        ),
        migrations.RemoveField(
            model_name='scorerankevent',
            name='ph_rank',
        ),
        migrations.RemoveField(
            model_name='scorerankevent',
            name='sr_rank',
        ),
        migrations.RemoveField(
            model_name='scorerankevent',
            name='ub_rank',
        ),
        migrations.RemoveField(
            model_name='scorerankevent',
            name='vt_rank',
        ),
    ]
