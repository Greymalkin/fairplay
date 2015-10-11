# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0002_auto_20151011_1859'),
        ('meet', '0002_auto_20151011_1859'),
    ]

    operations = [
        migrations.CreateModel(
            name='AthleteEvent',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, serialize=False, verbose_name='ID')),
                ('score', models.FloatField(blank=True, null=True)),
                ('rank', models.PositiveSmallIntegerField(null=True)),
                ('athlete', models.ForeignKey(to='registration.Gymnast', related_name='events')),
            ],
            options={
                'ordering': ['athlete', 'event'],
            },
        ),
        migrations.CreateModel(
            name='Division',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('min_age', models.PositiveSmallIntegerField(default=6)),
                ('max_age', models.PositiveSmallIntegerField(default=18)),
                ('level', models.ForeignKey(to='registration.Level')),
                ('meet', models.ForeignKey(to='meet.Meet', related_name='divisions')),
            ],
            options={
                'ordering': ['level', 'min_age'],
            },
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, serialize=False, verbose_name='ID')),
                ('order', models.PositiveSmallIntegerField()),
                ('name', models.CharField(help_text='Event name', max_length=255)),
                ('initials', models.CharField(help_text='Event initials', max_length=2)),
                ('meet', models.ForeignKey(to='meet.Meet', related_name='events')),
            ],
            options={
                'ordering': ['order'],
            },
        ),
        migrations.CreateModel(
            name='LEDSign',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, serialize=False, verbose_name='ID')),
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
                ('id', models.AutoField(primary_key=True, auto_created=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('message', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Session',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(help_text='Session name', max_length=255)),
                ('divisions', models.ManyToManyField(to='competition.Division', related_name='session')),
                ('meet', models.ForeignKey(to='meet.Meet', related_name='sessions')),
            ],
            options={
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='TeamAward',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('award_percentage', models.FloatField(default=0.66)),
                ('divisions', models.ManyToManyField(to='competition.Division')),
                ('meet', models.ForeignKey(to='meet.Meet', related_name='team_awards')),
            ],
        ),
        migrations.CreateModel(
            name='TeamAwardRank',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, serialize=False, verbose_name='ID')),
                ('rank', models.PositiveSmallIntegerField(null=True)),
                ('score', models.FloatField(null=True)),
                ('team', models.ForeignKey(to='registration.Team')),
                ('team_award', models.ForeignKey(to='competition.TeamAward')),
            ],
        ),
        migrations.AddField(
            model_name='event',
            name='sign',
            field=models.ForeignKey(to='competition.LEDSign'),
        ),
        migrations.AddField(
            model_name='athleteevent',
            name='event',
            field=models.ForeignKey(to='competition.Event', related_name='athletes'),
        ),
        migrations.AlterUniqueTogether(
            name='athleteevent',
            unique_together=set([('athlete', 'event')]),
        ),
    ]
