# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0012_auto_20151015_2251'),
    ]

    operations = [
        migrations.AlterField(
            model_name='team',
            name='per_gymnast_cost',
            field=models.ForeignKey(null=True, to='registration.GymnastPricing'),
        ),
        migrations.AlterField(
            model_name='team',
            name='per_level_cost',
            field=models.ForeignKey(null=True, to='registration.LevelPricing'),
        ),
    ]
