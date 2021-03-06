# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-09-15 13:41
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0029_ledsign_meet'),
    ]

    operations = [
        migrations.AddField(
            model_name='session',
            name='competition_start',
            field=models.TimeField(blank=True, null=True, verbose_name='Competition Start Time'),
        ),
        migrations.AddField(
            model_name='session',
            name='session_sart',
            field=models.DateTimeField(blank=True, null=True, verbose_name='Session Start Time'),
        ),
        migrations.AddField(
            model_name='session',
            name='warmup_start',
            field=models.TimeField(blank=True, null=True, verbose_name='Warmup Start Time'),
        ),
    ]
