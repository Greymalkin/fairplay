# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0005_auto_20141208_0357'),
    ]

    operations = [
        migrations.AlterField(
            model_name='agegroup',
            name='name',
            field=models.CharField(max_length=255),
            preserve_default=True,
        ),
    ]
