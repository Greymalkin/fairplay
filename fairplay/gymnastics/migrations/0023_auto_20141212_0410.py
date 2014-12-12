# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0022_merge'),
    ]

    operations = [
        migrations.RenameField(
            model_name='athleteevent',
            old_name='difficulty_score',
            new_name='score',
        ),
        migrations.RemoveField(
            model_name='athleteevent',
            name='execution_score',
        ),
        migrations.AddField(
            model_name='event',
            name='initials',
            field=models.CharField(default='AA', help_text=b'Event initials', max_length=2),
            preserve_default=False,
        ),
    ]
