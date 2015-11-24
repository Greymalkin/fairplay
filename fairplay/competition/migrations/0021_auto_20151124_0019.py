# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0020_auto_20151123_0145'),
    ]

    operations = [
        migrations.AlterField(
            model_name='teamawardrankathleteevent',
            name='athlete_event',
            field=models.ForeignKey(related_name='team_award_rankings', to='competition.AthleteEvent'),
        ),
        migrations.AlterField(
            model_name='teamawardrankathleteevent',
            name='team_award_rank',
            field=models.ForeignKey(related_name='athlete_event_rankings', to='competition.TeamAwardRank'),
        ),
    ]
