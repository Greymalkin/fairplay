# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Athlete',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('usag_id', models.CharField(max_length=20, unique=True, blank=True, null=True, verbose_name='USAG ID')),
                ('athlete_id', models.PositiveSmallIntegerField(unique=True, verbose_name='Athlete ID')),
                ('last_name', models.CharField(max_length=100)),
                ('first_name', models.CharField(max_length=100)),
                ('birth_date', models.DateField(blank=True, null=True)),
                ('position', models.PositiveSmallIntegerField(default=0)),
                ('overall_score', models.FloatField(null=True)),
                ('rank', models.PositiveSmallIntegerField(null=True)),
                ('scratched', models.BooleanField(default=False)),
            ],
            options={
                'ordering': ['last_name', 'first_name'],
            },
        ),
        migrations.CreateModel(
            name='AthleteEvent',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('score', models.FloatField(blank=True, null=True)),
                ('rank', models.PositiveSmallIntegerField(null=True)),
                ('athlete', models.ForeignKey(to='gymnastics.Athlete', related_name='events')),
            ],
            options={
                'ordering': ['athlete', 'event'],
            },
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('order', models.PositiveSmallIntegerField()),
                ('name', models.CharField(max_length=255, help_text='Event name')),
                ('initials', models.CharField(max_length=2, help_text='Event initials')),
            ],
            options={
                'ordering': ['order'],
            },
        ),
        migrations.CreateModel(
            name='Group',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('level', models.CharField(max_length=20)),
                ('age_group', models.CharField(max_length=255)),
                ('order', models.PositiveSmallIntegerField(default=0)),
            ],
            options={
                'ordering': ['level', 'order'],
            },
        ),
        migrations.CreateModel(
            name='LEDSign',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('sign_id', models.PositiveSmallIntegerField(unique=True)),
                ('device', models.CharField(max_length=255)),
            ],
            options={
                'verbose_name_plural': 'LED signs',
                'verbose_name': 'LED sign',
            },
        ),
        migrations.CreateModel(
            name='Message',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('message', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Session',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('name', models.CharField(max_length=255, help_text='Session name')),
                ('groups', models.ManyToManyField(to='gymnastics.Group', related_name='session')),
            ],
            options={
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='Team',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('qualified', models.BooleanField(default=True, help_text='Qualifies for team awards')),
            ],
            options={
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='TeamAward',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('award_percentage', models.FloatField(default=0.66)),
                ('groups', models.ManyToManyField(to='gymnastics.Group')),
            ],
        ),
        migrations.CreateModel(
            name='TeamAwardRank',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('rank', models.PositiveSmallIntegerField(null=True)),
                ('score', models.FloatField(null=True)),
                ('team', models.ForeignKey(to='gymnastics.Team')),
                ('team_award', models.ForeignKey(to='gymnastics.TeamAward')),
            ],
        ),
        migrations.AddField(
            model_name='event',
            name='sign',
            field=models.ForeignKey(to='gymnastics.LEDSign'),
        ),
        migrations.AddField(
            model_name='athleteevent',
            name='event',
            field=models.ForeignKey(to='gymnastics.Event', related_name='athletes'),
        ),
        migrations.AddField(
            model_name='athlete',
            name='group',
            field=models.ForeignKey(to='gymnastics.Group', related_name='athletes'),
        ),
        migrations.AddField(
            model_name='athlete',
            name='starting_event',
            field=models.ForeignKey(blank=True, to='gymnastics.Event', null=True),
        ),
        migrations.AddField(
            model_name='athlete',
            name='team',
            field=models.ForeignKey(to='gymnastics.Team', related_name='athletes'),
        ),
        migrations.AlterUniqueTogether(
            name='athleteevent',
            unique_together=set([('athlete', 'event')]),
        ),
    ]
