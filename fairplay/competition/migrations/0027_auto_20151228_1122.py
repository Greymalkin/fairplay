# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0026_auto_20151228_1116'),
    ]

    operations = [
        migrations.AlterField(
            model_name='event',
            name='sign',
            field=models.ForeignKey(null=True, blank=True, to='competition.LEDSign'),
        ),
    ]
