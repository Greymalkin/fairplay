# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-10-15 03:33
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0032_gymnast_discipline'),
        ('competition', '0042_mensartisticgymnast'),
    ]

    operations = [
        migrations.CreateModel(
            name='WomensArtisticGymnast',
            fields=[
            ],
            options={
                'ordering': ('athlete_id', 'last_name', 'first_name'),
                'verbose_name': 'WAG Gymnast',
                'verbose_name_plural': 'Womens Artistic Event Gymnasts',
                'proxy': True,
            },
            bases=('registration.gymnast',),
        ),
        migrations.RenameField(
            model_name='scorerankevent',
            old_name='b',
            new_name='bb',
        ),
    ]