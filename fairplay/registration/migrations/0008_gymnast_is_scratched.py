# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0007_auto_20150830_0206'),
    ]

    operations = [
        migrations.AddField(
            model_name='gymnast',
            name='is_scratched',
            field=models.BooleanField(verbose_name='Scratched?', default=False),
            preserve_default=True,
        ),
    ]
