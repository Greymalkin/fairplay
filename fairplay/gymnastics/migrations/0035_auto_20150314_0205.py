# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0034_auto_20150104_2102'),
    ]

    operations = [
        migrations.AlterField(
            model_name='group',
            name='level',
            field=models.CharField(max_length=20),
            preserve_default=True,
        ),
    ]
