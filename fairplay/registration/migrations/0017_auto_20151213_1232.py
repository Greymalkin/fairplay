# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0016_gymnast_tie_break'),
    ]

    operations = [
        migrations.AlterField(
            model_name='gymnast',
            name='tie_break',
            field=models.BigIntegerField(null=True, blank=True),
        ),
    ]
