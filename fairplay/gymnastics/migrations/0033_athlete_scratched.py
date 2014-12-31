# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0032_auto_20141214_1351'),
    ]

    operations = [
        migrations.AddField(
            model_name='athlete',
            name='scratched',
            field=models.BooleanField(default=False),
            preserve_default=True,
        ),
    ]
