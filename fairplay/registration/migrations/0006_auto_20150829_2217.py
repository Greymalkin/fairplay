# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0005_auto_20150829_2159'),
    ]

    operations = [
        migrations.AlterField(
            model_name='team',
            name='usag',
            field=models.CharField(max_length=225, verbose_name='USAG Club #', blank=True, null=True),
            preserve_default=True,
        ),
    ]
