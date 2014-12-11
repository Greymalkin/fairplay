# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0006_auto_20141208_0400'),
    ]

    operations = [
        migrations.AlterField(
            model_name='athlete',
            name='first_name',
            field=models.CharField(max_length=30),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='athlete',
            name='last_name',
            field=models.CharField(max_length=30),
            preserve_default=True,
        ),
    ]
