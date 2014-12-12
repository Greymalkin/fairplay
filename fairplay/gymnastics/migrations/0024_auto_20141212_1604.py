# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0023_auto_20141212_0410'),
    ]

    operations = [
        migrations.AlterField(
            model_name='session',
            name='groups',
            field=models.ManyToManyField(related_name='session', to='gymnastics.Group'),
            preserve_default=True,
        ),
    ]
