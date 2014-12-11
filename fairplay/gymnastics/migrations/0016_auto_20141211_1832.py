# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gymnastics', '0015_message'),
    ]

    operations = [
        migrations.CreateModel(
            name='TeamAward',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=255)),
                ('groups', models.ManyToManyField(to='gymnastics.Group')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AlterModelOptions(
            name='group',
            options={'ordering': ['level', 'age_group']},
        ),
        migrations.AddField(
            model_name='team',
            name='qualified',
            field=models.BooleanField(default=True, help_text=b'Qualifies for team awards'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='athlete',
            name='first_name',
            field=models.CharField(max_length=100),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='athlete',
            name='last_name',
            field=models.CharField(max_length=100),
            preserve_default=True,
        ),
    ]
