# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0009_auto_20151011_2127'),
    ]

    operations = [
        migrations.AlterField(
            model_name='team',
            name='per_gymnast_cost',
            field=models.ForeignKey(to='registration.GymnastPricing', default=1, null=True),
        ),
        migrations.AlterField(
            model_name='team',
            name='per_level_cost',
            field=models.ForeignKey(to='registration.LevelPricing', default=1, null=True),
        ),
    ]
