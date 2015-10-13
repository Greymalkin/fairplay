# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0010_auto_20151011_2252'),
        ('competition', '0004_auto_20151013_0313'),
    ]

    operations = [
        migrations.CreateModel(
            name='Team',
            fields=[
            ],
            options={
                'proxy': True,
            },
            bases=('registration.team',),
        ),
    ]
