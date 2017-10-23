# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-10-23 13:33
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('meet', '0017_auto_20171012_1020'),
    ]

    operations = [
        migrations.AddField(
            model_name='meet',
            name='team_award_percentage',
            field=models.FloatField(default=0.33),
        ),
        migrations.AlterField(
            model_name='meet',
            name='all_last_place_ties_in_awards',
            field=models.BooleanField(default=False, help_text='when running the award ceremony, push out award count when there is a tie at last place'),
        ),
        migrations.AlterField(
            model_name='meet',
            name='enable_ranking',
            field=models.BooleanField(default=False, help_text='scoring is live, gymnast ranks and team ranks are adjusting as new scores come in', verbose_name='Ranking'),
        ),
        migrations.AlterField(
            model_name='meet',
            name='event_award_percentage',
            field=models.FloatField(default=0.33),
        ),
    ]
