# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Meet',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('short_name', models.CharField(max_length=100)),
                ('host', models.CharField(max_length=200)),
                ('date', models.DateField()),
                ('event_award_percentage', models.FloatField(default=0.5, help_text='How many medals we are going to give. This is a percentage value and applies to all divisions in the entire meet.')),
                ('all_around_award_percentage', models.FloatField(default=0.5)),
                ('is_current_meet', models.BooleanField(default=False)),
                ('max_sessions_per_day', models.IntegerField(verbose_name='Max Sessions', default=3, help_text='Maximum number of sessions per day.')),
                ('flow_thresh_min', models.IntegerField(verbose_name='Session threshold, minimum achieved number', default=10, help_text="Might be useful to show a warning or indicator in the admin when a level/division of gymnasts is getting close to numbers that won't fit neatly in a session.  We need to know when sessions could be getting too big.  Shut down registration?  Have two sessions for the same combination of level/division? These numbers are for meet flow. You also have to keep in mind seating.")),
                ('flow_thresh_max', models.IntegerField(verbose_name='Session threshold, maximum number', default=15, help_text="Just because the maxiumum number has been met doesn't mean we'll absolutely stop registering gymnasts, but we should know we are in a situation. We might do want to stop registration for this level/division, depending on how other numbers look.")),
            ],
            options={
                'verbose_name_plural': 'Meet Configurations',
                'ordering': ('is_current_meet', '-date', 'name'),
                'verbose_name': 'Meet Configuration',
            },
        ),
    ]
