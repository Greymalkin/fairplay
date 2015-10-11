# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('meet', '0002_auto_20151011_1859'),
        ('registration', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='GymnastPricing',
            fields=[
                ('price', models.PositiveSmallIntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100)),
                ('meet', models.ForeignKey(to='meet.Meet', related_name='gymnast_pricing')),
            ],
            options={
                'verbose_name_plural': 'Pricing',
                'ordering': ['name'],
                'verbose_name': 'Pricing',
            },
        ),
        migrations.CreateModel(
            name='LevelPricing',
            fields=[
                ('price', models.PositiveSmallIntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100)),
                ('meet', models.ForeignKey(to='meet.Meet', related_name='level_pricing')),
            ],
            options={
                'verbose_name_plural': 'Pricing',
                'ordering': ['name'],
                'verbose_name': 'Pricing',
            },
        ),
        migrations.CreateModel(
            name='ShirtSize',
            fields=[
                ('abbr', models.CharField(primary_key=True, serialize=False, max_length=10)),
                ('name', models.CharField(max_length=50)),
            ],
            options={
                'verbose_name_plural': 'Shirt Sizes',
                'verbose_name': 'Shirt Size',
            },
        ),
        migrations.AddField(
            model_name='coach',
            name='meet',
            field=models.ForeignKey(to='meet.Meet', default=1, related_name='coaches'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='gymnast',
            name='athlete_id',
            field=models.PositiveSmallIntegerField(help_text='For use during competition', null=True, blank=True, unique=True, verbose_name='Athlete ID'),
        ),
        migrations.AddField(
            model_name='gymnast',
            name='meet',
            field=models.ForeignKey(to='meet.Meet', default=1, related_name='gymnasts'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='gymnast',
            name='overall_score',
            field=models.FloatField(null=True),
        ),
        migrations.AddField(
            model_name='gymnast',
            name='rank',
            field=models.PositiveSmallIntegerField(null=True),
        ),
        migrations.AddField(
            model_name='level',
            name='meet',
            field=models.ForeignKey(to='meet.Meet', default=1, related_name='levels'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='team',
            name='meet',
            field=models.ForeignKey(to='meet.Meet', default=1, related_name='teams'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='team',
            name='qualified',
            field=models.BooleanField(help_text='Qualifies for team awards', default=True),
        ),
    ]
