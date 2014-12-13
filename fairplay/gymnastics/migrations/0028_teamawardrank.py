# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0027_auto_20141213_1150'),
    ]

    operations = [
        migrations.CreateModel(
            name='TeamAwardRank',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('rank', models.PositiveSmallIntegerField()),
                ('team', models.ForeignKey(to='gymnastics.Team')),
                ('team_award', models.ForeignKey(to='gymnastics.TeamAward')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
