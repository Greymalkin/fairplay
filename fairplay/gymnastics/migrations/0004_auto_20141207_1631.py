# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0003_auto_20141207_0332'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='athleteevent',
            options={'ordering': ['position']},
        ),
        migrations.AlterModelOptions(
            name='ledsign',
            options={'verbose_name': 'LED sign', 'verbose_name_plural': 'LED signs'},
        ),
        migrations.AddField(
            model_name='athlete',
            name='age',
            field=models.PositiveSmallIntegerField(default=6),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='athlete',
            name='team',
            field=models.ForeignKey(related_name='athletes', to='gymnastics.Team'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='athleteevent',
            name='position',
            field=models.PositiveSmallIntegerField(verbose_name='Position', default=0),
            preserve_default=True,
        ),
    ]
