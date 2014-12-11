# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Athlete',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='ID', auto_created=True)),
                ('athlete_id', models.PositiveSmallIntegerField(unique=True)),
                ('last_name', models.CharField(max_length=255)),
                ('first_name', models.CharField(max_length=255)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='AthleteEvent',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='ID', auto_created=True)),
                ('postition', models.PositiveSmallIntegerField(verbose_name='Position')),
                ('difficulty_score', models.FloatField(blank=True, null=True)),
                ('execution_score', models.FloatField(blank=True, null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='ID', auto_created=True)),
                ('name', models.CharField(max_length=255, help_text='Event name')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='LEDSign',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='ID', auto_created=True)),
                ('sign_id', models.PositiveSmallIntegerField(unique=True)),
                ('device', models.CharField(max_length=255)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Level',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='ID', auto_created=True)),
                ('level', models.PositiveSmallIntegerField()),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Roster',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='ID', auto_created=True)),
                ('event', models.ForeignKey(to='gymnastics.Event')),
                ('level', models.ForeignKey(to='gymnastics.Level')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Team',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='ID', auto_created=True)),
                ('name', models.CharField(max_length=255, help_text='Team name')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='event',
            name='sign',
            field=models.ForeignKey(to='gymnastics.LEDSign'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='athleteevent',
            name='athlete',
            field=models.ForeignKey(to='gymnastics.Roster', related_name='events'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='athleteevent',
            name='roster',
            field=models.ForeignKey(to='gymnastics.Roster', related_name='athletes'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='athlete',
            name='level',
            field=models.ForeignKey(to='gymnastics.Level'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='athlete',
            name='team',
            field=models.ForeignKey(to='gymnastics.Team'),
            preserve_default=True,
        ),
    ]
