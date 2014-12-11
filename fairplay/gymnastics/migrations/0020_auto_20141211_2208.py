# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0019_remove_sessionevent_position'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='sessionevent',
            name='event',
        ),
        migrations.RemoveField(
            model_name='sessionevent',
            name='session',
        ),
        migrations.RemoveField(
            model_name='sessionevent',
            name='teams',
        ),
        migrations.DeleteModel(
            name='SessionEvent',
        ),
        migrations.AddField(
            model_name='athlete',
            name='starting_event',
            field=models.ForeignKey(to='gymnastics.Event', null=True),
            preserve_default=True,
        ),
    ]
