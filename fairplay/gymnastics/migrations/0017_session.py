# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0016_auto_20141211_1832'),
    ]

    operations = [
        migrations.CreateModel(
            name='Session',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(help_text=b'Session name', max_length=255)),
                ('groups', models.ManyToManyField(to='gymnastics.Group')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
