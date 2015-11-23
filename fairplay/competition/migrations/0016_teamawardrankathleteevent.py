# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0015_remove_teamaward_award_percentage'),
    ]

    operations = [
        migrations.CreateModel(
            name='TeamAwardRankAthleteEvent',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('rank', models.PositiveSmallIntegerField(null=True)),
                ('athlete_event', models.ForeignKey(to='competition.AthleteEvent')),
                ('event', models.ForeignKey(to='competition.Event')),
                ('team_award_rank', models.ForeignKey(to='competition.TeamAwardRank')),
            ],
        ),
    ]
