# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0012_auto_20141211_0234'),
    ]

    operations = [
        migrations.AlterField(
            model_name='athlete',
            name='group',
            field=models.ForeignKey(to='gymnastics.Group'),
            preserve_default=True,
        ),
    ]
