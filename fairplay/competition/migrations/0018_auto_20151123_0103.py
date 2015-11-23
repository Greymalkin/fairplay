# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0017_remove_teamaward_divisions'),
    ]

    operations = [
        migrations.AddField(
            model_name='division',
            name='all_around_award_count',
            field=models.PositiveSmallIntegerField(default=3),
        ),
        migrations.AddField(
            model_name='division',
            name='event_award_count',
            field=models.PositiveSmallIntegerField(default=3),
        ),
        migrations.AddField(
            model_name='teamaward',
            name='award_count',
            field=models.PositiveSmallIntegerField(default=3),
        ),
    ]
