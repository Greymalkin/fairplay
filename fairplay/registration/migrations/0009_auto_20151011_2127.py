# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0008_auto_20151011_2123'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='team',
            name='post_gymnast_cost',
        ),
        migrations.AddField(
            model_name='team',
            name='per_gymnast_cost',
            field=models.ForeignKey(to='registration.GymnastPricing', null=True),
        ),
        migrations.AlterField(
            model_name='team',
            name='per_level_cost',
            field=models.ForeignKey(to='registration.LevelPricing', null=True),
        ),
    ]
