# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0017_auto_20151213_1232'),
    ]

    operations = [
        migrations.AlterField(
            model_name='gymnast',
            name='athlete_id',
            field=models.PositiveSmallIntegerField(help_text='For use during competition', blank=True, null=True, verbose_name='Athlete ID'),
        ),
        migrations.AlterUniqueTogether(
            name='gymnast',
            unique_together=set([('meet', 'athlete_id')]),
        ),
    ]
