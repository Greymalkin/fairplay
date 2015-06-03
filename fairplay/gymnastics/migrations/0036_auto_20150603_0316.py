# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0035_auto_20150314_0205'),
    ]

    operations = [
        migrations.AddField(
            model_name='athlete',
            name='birth_date',
            field=models.DateField(blank=True, null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='athlete',
            name='usag_id',
            field=models.CharField(blank=True, max_length=20, unique=True, null=True),
            preserve_default=True,
        ),
    ]
