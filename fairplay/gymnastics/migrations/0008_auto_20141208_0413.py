# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0007_auto_20141208_0404'),
    ]

    operations = [
        migrations.RenameField(
            model_name='agegroup',
            old_name='name',
            new_name='group',
        ),
    ]
