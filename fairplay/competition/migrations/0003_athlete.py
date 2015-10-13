# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0010_auto_20151011_2252'),
        ('competition', '0002_auto_20151011_2251'),
    ]

    operations = [
        migrations.CreateModel(
            name='Athlete',
            fields=[
            ],
            options={
                'ordering': ['last_name', 'first_name'],
                'proxy': True,
            },
            bases=('registration.gymnast',),
        ),
    ]
