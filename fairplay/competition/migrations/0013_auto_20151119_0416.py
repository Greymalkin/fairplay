# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0012_auto_20151119_0412'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='ledshow',
            options={'verbose_name': 'LED show', 'verbose_name_plural': 'LED shows'},
        ),
        migrations.RemoveField(
            model_name='ledsign',
            name='sign_id',
        ),
        migrations.AddField(
            model_name='ledsign',
            name='name',
            field=models.CharField(max_length=255, default='changeme'),
            preserve_default=False,
        ),
    ]
