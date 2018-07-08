# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2018-07-08 16:15
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    replaces = [('competition', '0030_auto_20160915_0941'), ('competition', '0031_auto_20160915_0944'), ('competition', '0032_auto_20160915_1053'), ('competition', '0033_auto_20160915_1339'), ('competition', '0034_auto_20160920_1949'), ('competition', '0035_auto_20161014_1906'), ('competition', '0036_auto_20161014_2013'), ('competition', '0037_auto_20161014_2033'), ('competition', '0038_auto_20161014_2249'), ('competition', '0039_auto_20161014_2312'), ('competition', '0040_mensartisticgymnast'), ('competition', '0041_auto_20161014_2319'), ('competition', '0042_mensartisticgymnast'), ('competition', '0043_auto_20161014_2333'), ('competition', '0044_auto_20161020_1653'), ('competition', '0045_gymnastevent_place'), ('competition', '0046_auto_20161126_1838'), ('competition', '0047_auto_20161202_0026'), ('competition', '0048_auto_20170816_1349'), ('competition', '0049_auto_20170824_1813'), ('competition', '0050_auto_20170824_2241'), ('competition', '0051_auto_20170921_1133'), ('competition', '0052_auto_20170921_1249'), ('competition', '0053_auto_20170921_1252'), ('competition', '0054_auto_20170923_1539'), ('competition', '0055_auto_20170926_2357')]

    dependencies = [
        ('competition', '0029_ledsign_meet'),
        ('registration', '0032_gymnast_discipline'),
        ('registration', '0031_auto_20161014_1906'),
        ('meet', '0009_auto_20160916_1200'),
    ]

    operations = [
        migrations.AddField(
            model_name='session',
            name='competition_start',
            field=models.TimeField(blank=True, null=True, verbose_name='Competition Start Time'),
        ),
        migrations.AddField(
            model_name='session',
            name='session_start',
            field=models.DateTimeField(blank=True, null=True, verbose_name='Session Start Time'),
        ),
        migrations.AlterField(
            model_name='session',
            name='warmup',
            field=models.CharField(choices=[('Traditional', 'Traditional'), ('Warm-up/Compete', 'Warm-up/Compete')], default='Traditional', max_length=25, verbose_name='Session Flow'),
        ),
        migrations.AlterModelOptions(
            name='division',
            options={'ordering': ['level', 'min_age'], 'verbose_name': 'Age Division', 'verbose_name_plural': 'Age Divisions'},
        ),
        migrations.AlterModelOptions(
            name='teamawardrank',
            options={'verbose_name': 'Team Awards > Rank > Score', 'verbose_name_plural': 'Team Awards > Rank > Score'},
        ),
        migrations.AlterModelOptions(
            name='teamawardrankevent',
            options={'verbose_name': 'Team Awards > Rank > Event > Gymnast', 'verbose_name_plural': 'Team Awards > Rank > Event > Gymnast'},
        ),
        migrations.AddField(
            model_name='session',
            name='timed_warmup_start',
            field=models.TimeField(blank=True, null=True, verbose_name='Timed Warmup Start Time'),
        ),
        migrations.CreateModel(
            name='ScoreRankEvent',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fx', models.FloatField(blank=True, null=True)),
                ('ph', models.FloatField(blank=True, null=True)),
                ('sr', models.FloatField(blank=True, null=True)),
                ('vt', models.FloatField(blank=True, null=True)),
                ('pb', models.FloatField(blank=True, null=True)),
                ('hb', models.FloatField(blank=True, null=True)),
                ('ub', models.FloatField(blank=True, null=True)),
                ('b', models.FloatField(blank=True, null=True)),
                ('gymnast', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='scores', to='registration.Gymnast')),
                ('meet', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='scores', to='meet.Meet')),
            ],
        ),
        migrations.AlterField(
            model_name='teamaward',
            name='levels',
            field=models.ManyToManyField(related_name='team_awards', to='registration.Level'),
        ),
        migrations.AlterUniqueTogether(
            name='scorerankevent',
            unique_together=set([('gymnast', 'meet')]),
        ),
        migrations.CreateModel(
            name='MensArtisticGymnast',
            fields=[
            ],
            options={
                'proxy': True,
                'ordering': ('athlete_id', 'last_name', 'first_name'),
            },
            bases=('competition.gymnast',),
        ),
        migrations.AlterField(
            model_name='scorerankevent',
            name='gymnast',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='scores', to='registration.Gymnast'),
        ),
        migrations.DeleteModel(
            name='MensArtisticGymnast',
        ),
        migrations.CreateModel(
            name='MensArtisticGymnast',
            fields=[
            ],
            options={
                'ordering': ('athlete_id', 'last_name', 'first_name'),
                'proxy': True,
                'verbose_name_plural': 'Mens Artistic Event Gymnasts',
                'verbose_name': 'MAG Gymnast',
            },
            bases=('registration.gymnast',),
        ),
        migrations.CreateModel(
            name='WomensArtisticGymnast',
            fields=[
            ],
            options={
                'ordering': ('athlete_id', 'last_name', 'first_name'),
                'verbose_name': 'WAG Gymnast',
                'verbose_name_plural': 'Womens Artistic Event Gymnasts',
                'proxy': True,
            },
            bases=('registration.gymnast',),
        ),
        migrations.RenameField(
            model_name='scorerankevent',
            old_name='b',
            new_name='bb',
        ),
        migrations.AddField(
            model_name='session',
            name='presentation_start',
            field=models.TimeField(blank=True, null=True, verbose_name='Presentation of Teams Start Time'),
        ),
        migrations.AddField(
            model_name='gymnastevent',
            name='place',
            field=models.PositiveSmallIntegerField(null=True),
        ),
        migrations.AlterModelOptions(
            name='gymnastevent',
            options={'ordering': ['gymnast', 'event'], 'verbose_name': 'Gymnast Event', 'verbose_name_plural': 'Gymnast Events > Rank > Score > Place'},
        ),
        migrations.AlterField(
            model_name='teamawardrank',
            name='team',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='team_ranks', to='registration.Team'),
        ),
        migrations.AlterField(
            model_name='teamawardrank',
            name='team_award',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='team_ranks', to='competition.TeamAward'),
        ),
        migrations.AlterField(
            model_name='teamaward',
            name='award_count',
            field=models.PositiveSmallIntegerField(default=0, help_text='Number of places team awards will go out to'),
        ),
        migrations.AddField(
            model_name='event',
            name='active',
            field=models.BooleanField(default=True, help_text='Event is included as part of this meet'),
        ),
        migrations.AddField(
            model_name='event',
            name='is_mag',
            field=models.BooleanField(default=True, help_text="Men's Artistic Gymnastics Event", verbose_name='MAG'),
        ),
        migrations.AddField(
            model_name='event',
            name='is_wag',
            field=models.BooleanField(default=True, help_text="Women's Artistic Gymnastics Event", verbose_name='WAG'),
        ),
        migrations.RemoveField(
            model_name='event',
            name='meet',
        ),
        migrations.AlterField(
            model_name='ledshow',
            name='name',
            field=models.CharField(max_length=255, unique=True),
        ),
        migrations.RemoveField(
            model_name='ledsign',
            name='meet',
        ),
        migrations.AlterUniqueTogether(
            name='ledsign',
            unique_together=set([('name', 'device')]),
        ),
        migrations.AlterField(
            model_name='division',
            name='level',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='divisions', to='registration.Level'),
        ),
        migrations.AlterField(
            model_name='teamaward',
            name='levels',
            field=models.ManyToManyField(null=True, related_name='team_awards', to='registration.Level'),
        ),
        migrations.AlterField(
            model_name='event',
            name='sign',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='competition.LEDSign'),
        ),
        migrations.AlterField(
            model_name='teamaward',
            name='levels',
            field=models.ManyToManyField(related_name='team_awards', to='registration.Level'),
        ),
        migrations.AlterField(
            model_name='session',
            name='divisions',
            field=models.ManyToManyField(blank=True, help_text='\n        Select from the list on the left which age divisions will compete in this session.\n        All gymnasts in the selected age division will be automatically assigned to this session.\n        Age divisions may not be split across multiple sessions.', related_name='session', to='competition.Division'),
        ),
        migrations.AlterField(
            model_name='session',
            name='name',
            field=models.CharField(help_text='Session 1, Session 2, etc.', max_length=255),
        ),
    ]
