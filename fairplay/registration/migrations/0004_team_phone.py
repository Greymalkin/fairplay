# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0003_auto_20150726_1715'),
    ]

    operations = [
        migrations.AddField(
            model_name='team',
            name='phone',
            field=models.CharField(verbose_name='Phone', blank=True, max_length=100, null=True),
            preserve_default=True,
        ),
    ]
