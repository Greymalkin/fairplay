# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0022_remove_ledsign_device'),
    ]

    operations = [
        migrations.AddField(
            model_name='ledsign',
            name='device',
            field=models.PositiveSmallIntegerField(default=1),
            preserve_default=False,
        ),
    ]
