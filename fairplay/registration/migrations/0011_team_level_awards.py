# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0008_auto_20151015_2248'),
        ('registration', '0010_auto_20151011_2252'),
    ]

    operations = [
        migrations.AddField(
            model_name='team',
            name='level_awards',
            field=models.ManyToManyField(to='competition.TeamAward', verbose_name='Team Awards Levels', related_name='teams', blank=True),
        ),
    ]
