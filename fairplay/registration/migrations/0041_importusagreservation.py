# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-08-28 00:03
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0040_discipline'),
    ]

    operations = [
        migrations.CreateModel(
            name='ImportUsagReservation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
    ]