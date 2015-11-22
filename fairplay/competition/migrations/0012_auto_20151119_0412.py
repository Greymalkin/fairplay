# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('competition', '0011_auto_20151112_0153'),
    ]

    operations = [
        migrations.CreateModel(
            name='LEDShow',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('name', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='LEDShowMessage',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('message', models.TextField()),
                ('led_show', models.ForeignKey(to='competition.LEDShow')),
                ('led_sign', models.ForeignKey(to='competition.LEDSign')),
            ],
        ),
        migrations.DeleteModel(
            name='Message',
        ),
    ]
