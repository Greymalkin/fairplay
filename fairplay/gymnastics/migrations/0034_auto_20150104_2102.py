# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0033_athlete_scratched'),
    ]

    operations = [
        migrations.CreateModel(
            name='MeetSettings',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=255)),
                ('date', models.DateField()),
                ('event_award_percentage', models.FloatField(default=0.5)),
                ('all_around_award_percentage', models.FloatField(default=0.5)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='teamaward',
            name='award_percentage',
            field=models.FloatField(default=0.66),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='athlete',
            name='starting_event',
            field=models.ForeignKey(null=True, to='gymnastics.Event', blank=True),
            preserve_default=True,
        ),
    ]
