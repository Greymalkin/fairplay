# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0005_auto_20151011_2013'),
    ]

    operations = [
        migrations.AddField(
            model_name='team',
            name='per_level_cost',
            field=models.ForeignKey(to='registration.LevelPricing', null=True, default=1),
        ),
        migrations.AddField(
            model_name='team',
            name='post_gymnast_cost',
            field=models.ForeignKey(to='registration.GymnastPricing', null=True, default=1),
        ),
    ]
