# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('meet', '0002_auto_20151011_1859'),
        ('registration', '0004_auto_20151011_2013'),
    ]

    operations = [
        migrations.CreateModel(
            name='GymnastPricing',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('price', models.PositiveSmallIntegerField(default=0)),
                ('name', models.CharField(max_length=100)),
                ('meet', models.ForeignKey(to='meet.Meet', related_name='gymnast_pricing')),
            ],
            options={
                'ordering': ['name'],
                'verbose_name_plural': 'Gymnast Pricing',
                'verbose_name': 'Gymnast Pricing',
            },
        ),
        migrations.CreateModel(
            name='LevelPricing',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('price', models.PositiveSmallIntegerField(default=0)),
                ('name', models.CharField(max_length=100)),
                ('meet', models.ForeignKey(to='meet.Meet', related_name='level_pricing')),
            ],
            options={
                'ordering': ['name'],
                'verbose_name_plural': 'Level Pricing',
                'verbose_name': 'Level Pricing',
            },
        ),
        migrations.CreateModel(
            name='ShirtSize',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
            ],
            options={
                'verbose_name_plural': 'Shirt Sizes',
                'verbose_name': 'Shirt Size',
            },
        ),
        migrations.AddField(
            model_name='gymnast',
            name='shirt',
            field=models.ForeignKey(null=True, blank=True, to='registration.ShirtSize'),
        ),
    ]
