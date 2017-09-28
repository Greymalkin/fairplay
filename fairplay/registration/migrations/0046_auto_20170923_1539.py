# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-09-23 19:39
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0045_auto_20170921_1155'),
    ]

    operations = [
        migrations.AlterField(
            model_name='gymnast',
            name='division',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='gymnasts', to='competition.Division', verbose_name='Age division'),
        ),
        migrations.AlterField(
            model_name='gymnast',
            name='level',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='gymnasts', to='registration.Level'),
        ),
        migrations.AlterField(
            model_name='gymnast',
            name='shirt',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='gymnasts', to='registration.ShirtSize'),
        ),
        migrations.AlterField(
            model_name='gymnast',
            name='starting_event',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='starting_gymnasts', to='competition.Event'),
        ),
    ]