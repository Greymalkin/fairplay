# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0007_auto_20151011_2025'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='gymnast',
            name='tshirt',
        ),
        migrations.RemoveField(
            model_name='team',
            name='per_gymnast_cost',
        ),
    ]
