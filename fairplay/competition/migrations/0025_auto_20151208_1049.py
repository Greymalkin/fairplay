# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0024_auto_20151125_0425'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='teamawardrank',
            options={'verbose_name': 'Team Award Rank', 'verbose_name_plural': 'Team Award Ranks'},
        ),
        migrations.AlterModelOptions(
            name='teamawardrankathleteevent',
            options={'verbose_name': 'Team Award Rank Athlete Event', 'verbose_name_plural': 'Team Award Rank Athlete Events'},
        ),
        migrations.AlterField(
            model_name='division',
            name='all_around_award_count',
            field=models.PositiveSmallIntegerField(help_text='Number of places all around awards will go out to', default=3, verbose_name='All-around award count'),
        ),
        migrations.AlterField(
            model_name='division',
            name='event_award_count',
            field=models.PositiveSmallIntegerField(help_text='Number of places individual awards will go out to', default=3),
        ),
        migrations.AlterField(
            model_name='teamaward',
            name='award_count',
            field=models.PositiveSmallIntegerField(help_text='Number of places team awards will go out to', default=3),
        ),
    ]
