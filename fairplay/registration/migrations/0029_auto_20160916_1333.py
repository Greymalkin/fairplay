# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-09-16 17:33
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0028_auto_20160916_1217'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='gymnastpricing',
            name='meet',
        ),
        migrations.RemoveField(
            model_name='levelpricing',
            name='meet',
        ),
        migrations.RemoveField(
            model_name='registration',
            name='meet',
        ),
        migrations.RemoveField(
            model_name='registration',
            name='per_gymnast_cost',
        ),
        migrations.RemoveField(
            model_name='registration',
            name='per_level_cost',
        ),
        migrations.RemoveField(
            model_name='registration',
            name='team_awards',
        ),
        migrations.AlterField(
            model_name='gymnast',
            name='per_gymnast_cost',
            field=models.PositiveSmallIntegerField(default=90, null=True, verbose_name='$ Registration'),
        ),
        migrations.AlterField(
            model_name='team',
            name='team_award_cost',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=6, verbose_name='Total Team Award Cost'),
        ),
        migrations.AlterField(
            model_name='team',
            name='total_cost',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=6, verbose_name='Total Cost'),
        ),
        migrations.DeleteModel(
            name='GymnastPricing',
        ),
        migrations.DeleteModel(
            name='LevelPricing',
        ),
        migrations.DeleteModel(
            name='Registration',
        ),
    ]