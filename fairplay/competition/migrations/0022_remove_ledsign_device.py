# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0021_auto_20151124_0019'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='ledsign',
            name='device',
        ),
    ]
