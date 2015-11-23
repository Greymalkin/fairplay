# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('meet', '0003_auto_20151012_2322'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='meet',
            name='all_around_award_percentage',
        ),
        migrations.RemoveField(
            model_name='meet',
            name='event_award_percentage',
        ),
    ]
