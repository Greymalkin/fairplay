# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0030_auto_20141213_1228'),
    ]

    operations = [
        migrations.AddField(
            model_name='group',
            name='order',
            field=models.PositiveSmallIntegerField(default=0),
            preserve_default=True,
        ),
    ]
