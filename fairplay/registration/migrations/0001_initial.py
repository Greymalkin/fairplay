# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Coach',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('first_name', models.CharField(max_length=100, verbose_name='First Name')),
                ('last_name', models.CharField(max_length=100, verbose_name='Last Name')),
                ('usag', models.CharField(max_length=225, blank=True, null=True, verbose_name='USAG #')),
                ('is_flagged', models.BooleanField(default=False, verbose_name='Flagged!')),
                ('is_verified', models.BooleanField(default=False, verbose_name='Verified')),
                ('notes', models.TextField(blank=True, null=True)),
                ('usag_expire_date', models.DateField(blank=True, null=True, verbose_name='USAG Expires')),
                ('safety_expire_date', models.DateField(blank=True, null=True, verbose_name='Safety Expires')),
                ('background_expire_date', models.DateField(blank=True, null=True, verbose_name='Background Expires')),
            ],
            options={
                'verbose_name_plural': 'Coaches',
                'verbose_name': 'Coach',
            },
        ),
        migrations.CreateModel(
            name='Gymnast',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('first_name', models.CharField(max_length=100, verbose_name='First Name')),
                ('last_name', models.CharField(max_length=100, verbose_name='Last Name')),
                ('usag', models.CharField(max_length=225, blank=True, null=True, verbose_name='USAG #')),
                ('is_flagged', models.BooleanField(default=False, verbose_name='Flagged!')),
                ('is_verified', models.BooleanField(default=False, verbose_name='Verified')),
                ('notes', models.TextField(blank=True, null=True)),
                ('dob', models.DateField(blank=True, null=True)),
                ('age', models.PositiveSmallIntegerField(verbose_name='Age', blank=True, null=True, help_text='Competitive Age (as of 9/1)')),
                ('is_us_citizen', models.BooleanField(default=True, verbose_name='US Citizen?')),
                ('tshirt', models.CharField(verbose_name='T-Shirt Size', max_length=20, blank=True, null=True, choices=[('Extra Small (Youth)', 'Extra Small (Youth)'), ('Small (Youth)', 'Small (Youth)'), ('Medium (Youth)', 'Medium (Youth)'), ('Large (Youth)', 'Large (Youth)'), ('Extra Large (Youth)', 'Extra Large (Youth)'), ('Extra Small (Adult)', 'Extra Small (Adult)'), ('Small (Adult)', 'Small (Adult)'), ('Medium (Adult)', 'Medium (Adult)'), ('Large (Adult)', 'Large (Adult)'), ('Extra Large (Adult)', 'Extra Large (Adult)')])),
                ('is_scratched', models.BooleanField(default=False, verbose_name='Scratched?')),
            ],
            options={
                'verbose_name_plural': 'Gymnasts',
                'verbose_name': 'Gymnast',
            },
        ),
        migrations.CreateModel(
            name='Level',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('level', models.CharField(max_length=5)),
                ('order', models.PositiveSmallIntegerField(default=0)),
            ],
            options={
                'verbose_name_plural': 'Levels',
                'ordering': ('order',),
                'verbose_name': 'Level',
            },
        ),
        migrations.CreateModel(
            name='Team',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, auto_created=True, verbose_name='ID')),
                ('gym', models.CharField(max_length=100, help_text='ex. Fairland Boys Gymnastics')),
                ('team', models.CharField(max_length=100, blank=True, default='', help_text='ex. Fairland')),
                ('address_1', models.CharField(max_length=100, blank=True, null=True, verbose_name='Address 1')),
                ('address_2', models.CharField(max_length=100, blank=True, null=True, verbose_name='Address 2')),
                ('city', models.CharField(max_length=100, blank=True, null=True, verbose_name='City')),
                ('state', models.CharField(max_length=100, blank=True, null=True, verbose_name='State')),
                ('postal_code', models.CharField(max_length=100, blank=True, null=True, verbose_name='Postal Code')),
                ('phone', models.CharField(max_length=100, blank=True, null=True, verbose_name='Phone')),
                ('first_name', models.CharField(max_length=100, verbose_name='First Name')),
                ('last_name', models.CharField(max_length=100, verbose_name='Last Name')),
                ('email', models.CharField(max_length=225, blank=True, null=True, verbose_name='Email')),
                ('usag', models.CharField(max_length=225, blank=True, null=True, verbose_name='USAG Club #')),
                ('per_gymnast_cost', models.CharField(verbose_name='Per Gymnast Cost', max_length=5, null=True, choices=[('80', '$80 per gymnast'), ('90', '$90 per gymnast')])),
                ('gymnast_cost', models.DecimalField(decimal_places=2, default=0, verbose_name='Total Gymnast Cost', max_digits=6)),
                ('level_cost', models.DecimalField(decimal_places=2, default=0, verbose_name='Level Cost', max_digits=6)),
                ('total_cost', models.DecimalField(decimal_places=2, default=0, verbose_name='Total Registration Cost', max_digits=6)),
                ('started', models.DateTimeField(auto_now_add=True, verbose_name='Form Started')),
                ('updated', models.DateTimeField(auto_now=True, verbose_name='Form Last Updated')),
                ('payment_postmark', models.DateField(blank=True, null=True, verbose_name='Payment Postmark Date')),
                ('registration_complete', models.DateTimeField(blank=True, null=True, verbose_name='Date Registration Form Completed')),
                ('paid_in_full', models.BooleanField(default=False, verbose_name='Paid In Full?')),
                ('notes', models.TextField(blank=True, null=True)),
                ('levels', models.ManyToManyField(to='registration.Level', blank=True, related_name='registrations_set', verbose_name='Team Awards Levels')),
            ],
            options={
                'verbose_name_plural': 'Teams',
                'ordering': ('gym',),
                'verbose_name': 'Team',
            },
        ),
        migrations.AddField(
            model_name='gymnast',
            name='level',
            field=models.ForeignKey(blank=True, to='registration.Level', null=True),
        ),
        migrations.AddField(
            model_name='gymnast',
            name='team',
            field=models.ForeignKey(to='registration.Team', related_name='gymnasts'),
        ),
        migrations.AddField(
            model_name='coach',
            name='team',
            field=models.ForeignKey(to='registration.Team', related_name='coaches'),
        ),
    ]
