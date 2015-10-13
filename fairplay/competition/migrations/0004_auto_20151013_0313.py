# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0003_athlete'),
    ]

    operations = [
        migrations.CreateModel(
            name='AthleteEvent',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, verbose_name='ID', serialize=False)),
                ('score', models.FloatField(null=True, blank=True)),
                ('rank', models.PositiveSmallIntegerField(null=True)),
                ('event', models.ForeignKey(to='competition.Event', related_name='gymnasts')),
                ('gymnast', models.ForeignKey(to='competition.Athlete', related_name='events')),
            ],
            options={
                'ordering': ['gymnast', 'event'],
            },
        ),
        migrations.AlterUniqueTogether(
            name='gymnastevent',
            unique_together=set([]),
        ),
        migrations.RemoveField(
            model_name='gymnastevent',
            name='event',
        ),
        migrations.RemoveField(
            model_name='gymnastevent',
            name='gymnast',
        ),
        migrations.DeleteModel(
            name='GymnastEvent',
        ),
        migrations.AlterUniqueTogether(
            name='athleteevent',
            unique_together=set([('gymnast', 'event')]),
        ),
    ]
