# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0002_auto_20141207_0328'),
    ]

    operations = [
        migrations.RenameField(
            model_name='athleteevent',
            old_name='postition',
            new_name='position',
        ),
    ]
