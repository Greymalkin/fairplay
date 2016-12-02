# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-10-15 03:25
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0032_gymnast_discipline'),
        ('competition', '0041_auto_20161014_2319'),
    ]

    operations = [
        migrations.CreateModel(
            name='MensArtisticGymnast',
            fields=[
            ],
            options={
                'ordering': ('athlete_id', 'last_name', 'first_name'),
                'proxy': True,
                'verbose_name_plural': 'Mens Artistic Event Gymnasts',
                'verbose_name': 'MAG Gymnast',
            },
            bases=('registration.gymnast',),
        ),
    ]