# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-09-21 16:52
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0052_auto_20170921_1249'),
    ]

    operations = [
        migrations.AlterField(
            model_name='teamaward',
            name='levels',
            field=models.ManyToManyField(null=True, related_name='team_awards', to='registration.Level'),
        ),
    ]
