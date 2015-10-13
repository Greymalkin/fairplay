# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('meet', '0002_auto_20151011_1859'),
    ]

    operations = [
        migrations.AddField(
            model_name='meet',
            name='notes',
            field=models.TextField(null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='meet',
            name='all_around_award_percentage',
            field=models.FloatField(verbose_name='AA Awards', default=0.5, help_text='Percentage value.  How many athletes in All Around will get medals?'),
        ),
        migrations.AlterField(
            model_name='meet',
            name='event_award_percentage',
            field=models.FloatField(verbose_name='Event Awards', default=0.5, help_text='This is a percentage value and applies to all divisions in the entire meet. How many awards will we give per event?'),
        ),
    ]
