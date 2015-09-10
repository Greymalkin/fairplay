# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0004_team_phone'),
    ]

    operations = [
        migrations.AddField(
            model_name='team',
            name='usag',
            field=models.CharField(verbose_name='USAG Club #', default='', max_length=225),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='team',
            name='levels',
            field=models.ManyToManyField(blank=True, to='registration.Level', verbose_name='Team Awards Levels', related_name='registrations_set', null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='team',
            name='per_gymnast_cost',
            field=models.CharField(choices=[('80', '$80 per gymnast'), ('90', '$90 per gymnast')], verbose_name='Per Gymnast Cost', max_length=5, null=True),
            preserve_default=True,
        ),
    ]
