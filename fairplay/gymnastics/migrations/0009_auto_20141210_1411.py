# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0008_auto_20141208_0413'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='athlete',
            name='initial_event',
        ),
        migrations.AddField(
            model_name='team',
            name='initial_event',
            field=models.ForeignKey(to='gymnastics.Event', default=5),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='athlete',
            name='position',
            field=models.PositiveSmallIntegerField(default=0),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='athleteevent',
            unique_together=set([('athlete', 'event')]),
        ),
    ]
