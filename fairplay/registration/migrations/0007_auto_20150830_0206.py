# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0006_auto_20150829_2217'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='team',
            options={'verbose_name': 'Team', 'ordering': ('gym',), 'verbose_name_plural': 'Teams'},
        ),
        migrations.RenameField(
            model_name='team',
            old_name='name',
            new_name='gym',
        ),
        migrations.AlterField(
            model_name='gymnast',
            name='age',
            field=models.PositiveSmallIntegerField(verbose_name='Age', help_text='Competitive Age (as of 9/1)'),
            preserve_default=True,
        ),
    ]
