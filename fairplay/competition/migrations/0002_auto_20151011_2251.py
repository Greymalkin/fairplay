# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0003_auto_20151011_1916'),
        ('competition', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='GymnastEvent',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', auto_created=True, serialize=False)),
                ('score', models.FloatField(null=True, blank=True)),
                ('rank', models.PositiveSmallIntegerField(null=True)),
                ('event', models.ForeignKey(related_name='gymnasts', to='competition.Event')),
                ('gymnast', models.ForeignKey(related_name='events', to='registration.Gymnast')),
            ],
            options={
                'ordering': ['gymnast', 'event'],
            },
        ),
        migrations.AlterUniqueTogether(
            name='athleteevent',
            unique_together=set([]),
        ),
        migrations.RemoveField(
            model_name='athleteevent',
            name='athlete',
        ),
        migrations.RemoveField(
            model_name='athleteevent',
            name='event',
        ),
        migrations.DeleteModel(
            name='AthleteEvent',
        ),
        migrations.AlterUniqueTogether(
            name='gymnastevent',
            unique_together=set([('gymnast', 'event')]),
        ),
    ]
