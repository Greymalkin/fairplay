# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0003_auto_20151011_1916'),
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
        migrations.DeleteModel(
            name='ShirtSize',
        ),
        migrations.AlterField(
            model_name='gymnast',
            name='overall_score',
            field=models.FloatField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='gymnast',
            name='rank',
            field=models.PositiveSmallIntegerField(blank=True, null=True),
        ),
        migrations.DeleteModel(
            name='GymnastPricing',
        ),
        migrations.DeleteModel(
            name='LevelPricing',
        ),
    ]
