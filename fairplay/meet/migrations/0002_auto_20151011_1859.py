# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('meet', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='meet',
            options={'verbose_name_plural': 'Meets', 'ordering': ('is_current_meet', '-date', 'name'), 'verbose_name': 'Meet'},
        ),
        migrations.AlterField(
            model_name='meet',
            name='all_around_award_percentage',
            field=models.FloatField(default=0.5, verbose_name='AA %age'),
        ),
        migrations.AlterField(
            model_name='meet',
            name='event_award_percentage',
            field=models.FloatField(help_text='How many medals we are going to give. This is a percentage value and applies to all divisions in the entire meet.', default=0.5, verbose_name='Event %age'),
        ),
        migrations.AlterField(
            model_name='meet',
            name='is_current_meet',
            field=models.BooleanField(default=False, verbose_name='Current Meet?'),
        ),
    ]
