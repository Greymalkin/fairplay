# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('meet', '0004_auto_20151122_2326'),
    ]

    operations = [
        migrations.AddField(
            model_name='meet',
            name='all_around_award_percentage',
            field=models.FloatField(default=0.5),
        ),
        migrations.AddField(
            model_name='meet',
            name='event_award_percentage',
            field=models.FloatField(default=0.45),
        ),
    ]
