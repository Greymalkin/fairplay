# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-09-15 23:17
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('meet', '0007_auto_20160520_2229'),
    ]

    operations = [
        migrations.AddField(
            model_name='meet',
            name='enable_ranking',
            field=models.BooleanField(default=False, help_text='When turned on, scores saved to the cms will cause ranks to adjust. \n            Must be turned on while the meet is running. \n            When turned off, admin will load more quickly.', verbose_name='Enable Ranking'),
        ),
    ]