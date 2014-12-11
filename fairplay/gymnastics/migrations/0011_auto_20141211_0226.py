# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0010_auto_20141210_1424'),
    ]

    operations = [
        migrations.CreateModel(
            name='Group',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, verbose_name='ID', serialize=False)),
                ('age_group', models.CharField(max_length=255)),
                ('level', models.ForeignKey(null=True, to='gymnastics.Level')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.RemoveField(
            model_name='athlete',
            name='age_group',
        ),
        migrations.DeleteModel(
            name='AgeGroup',
        ),
        migrations.RemoveField(
            model_name='athlete',
            name='level',
        ),
        migrations.AddField(
            model_name='athlete',
            name='group',
            field=models.ForeignKey(null=True, to='gymnastics.Group'),
            preserve_default=True,
        ),
    ]
