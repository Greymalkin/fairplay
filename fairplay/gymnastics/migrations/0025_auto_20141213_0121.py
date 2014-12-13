# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0024_auto_20141212_1604'),
    ]

    operations = [
        migrations.AlterField(
            model_name='event',
            name='initials',
            field=models.CharField(max_length=2, help_text='Event initials'),
            preserve_default=True,
        ),
    ]
