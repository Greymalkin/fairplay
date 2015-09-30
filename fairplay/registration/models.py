from django.db import models
from django.db.models.signals import post_save, m2m_changed
from django.dispatch import receiver


class Team(models.Model):
    gym = models.CharField(max_length=100)
    address_1 = models.CharField('Address 1', max_length=100, blank=True, null=True)
    address_2 = models.CharField('Address 2', max_length=100, blank=True, null=True)
    city = models.CharField('City', max_length=100, blank=True, null=True)
    state = models.CharField('State', max_length=100, blank=True, null=True)
    postal_code = models.CharField('Postal Code', max_length=100, blank=True, null=True)
    phone = models.CharField('Phone', max_length=100, blank=True, null=True)
    first_name = models.CharField('First Name', max_length=100)
    last_name = models.CharField('Last Name', max_length=100)
    email = models.CharField('Email', max_length=225, blank=True, null=True)
    usag = models.CharField('USAG Club #', max_length=225, blank=True, null=True)
    EARLY = '80'
    NORMAL = '90'
    COSTS = (
        (EARLY, '$80 per gymnast'), (NORMAL, '$90 per gymnast')
    )
    per_gymnast_cost = models.CharField('Per Gymnast Cost', max_length=5, null=True, choices=COSTS)
    PER_LEVEL_COST = '50'
    levels = models.ManyToManyField('Level', blank=True, null=True, related_name='registrations_set', verbose_name="Team Awards Levels")
    gymnast_cost = models.DecimalField('Total Gymnast Cost', decimal_places=2, max_digits=6, default=0)
    level_cost = models.DecimalField('Level Cost', decimal_places=2, max_digits=6, default=0)
    total_cost = models.DecimalField('Total Registration Cost', decimal_places=2, max_digits=6, default=0)
    started = models.DateTimeField('Form Started', auto_now_add=True)
    updated = models.DateTimeField('Form Last Updated', auto_now=True)
    payment_postmark = models.DateField('Payment Postmark Date', blank=True, null=True)
    registration_complete = models.DateTimeField('Date Registration Form Completed', blank=True, null=True)
    paid_in_full = models.BooleanField('Paid In Full?', default=False)
    notes = models.TextField(blank=True, null=True)

    class Meta:
        verbose_name = 'Team'
        verbose_name_plural = 'Teams'
        ordering = ('gym',)

    def __str__(self):
        return '{0}'.format(self.gym)

    def save(self, *args, **kwargs):
        # custom pre-save
        super(Team, self).save(*args, **kwargs)
        # custom post-save

    def contact_name(self):
        return '{} {}'.format(self.first_name, self.last_name)

    def calc_level_cost(self):
        num_levels = self.levels.count()
        # levels 9,10 are priced as one single 9/10 level
        if self.levels.filter(level__exact=10).count() == 1 and self.levels.filter(level__exact=9).count() == 1:
            self.level_cost = int(self.PER_LEVEL_COST) * (num_levels - 1)
        elif num_levels > 0:
            self.level_cost = int(self.PER_LEVEL_COST) * num_levels
        else:
            self.level_cost = 0
        return self.level_cost

    def calc_gymnast_cost(self):
        num_gymnasts = self.gymnasts.filter(is_scratched=False).count()
        if num_gymnasts > 0:
            self.gymnast_cost = int(self.per_gymnast_cost) * num_gymnasts
        else:
            self.gymnast_cost = 0
        return self.gymnast_cost

    def calc_total_cost(self):
        return self.gymnast_cost + self.level_cost


class Person(models.Model):
    first_name = models.CharField('First Name', max_length=100)
    last_name = models.CharField('Last Name', max_length=100)
    usag = models.CharField('USAG #', max_length=225, blank=True, null=True)
    notes = models.TextField(blank=True, null=True)

    class Meta:
        abstract = True
        ordering = ('last_name', 'first_name')

    def __str__(self):
        return "{1}, {0}".format(self.first_name, self.last_name)

    def related_label(self):
        name = '{0}, {1}'.format(self.last_name, self.first_name)
        if self.usag and len(self.usag.strip()):
            name = '{1} ({1})'.format(name, self.usag)
        return name

    @staticmethod
    def autocomplete_search_fields():
        return ("id__iexact", "first_name__icontains", "last_name__icontains")


class Coach(Person):
    team = models.ForeignKey(Team, related_name="coaches")
    usag_expire_date = models.DateField('USAG Expires', blank=True, null=True)
    safety_expire_date = models.DateField('Safety Expires', blank=True, null=True)
    background_expire_date = models.DateField('Background Expires', blank=True, null=True)

    class Meta:
        verbose_name_plural = 'Coaches'
        verbose_name = 'Coach'


class Gymnast(Person):
    team = models.ForeignKey(Team, related_name="gymnasts")
    dob = models.DateField(blank=True, null=True)
    age = models.PositiveSmallIntegerField('Age', blank=True, help_text='Competitive Age (as of 9/1)')
    is_us_citizen = models.BooleanField('US Citizen?', default=False)
    XSMALL = 'Extra Small (Youth)'
    SMALL = 'Small (Youth)'
    MEDIUM = 'Medium (Youth)'
    LARGE = 'Large (Youth)'
    XLARGE = 'Extra Large (Youth)'
    ADULTXSM = 'Exra Small (Adult)'
    ADULTSM = 'Small (Adult)'
    ADULTMD = 'Medium (Adult)'
    ADULTLG = 'Large (Adult)'
    ADULTXLG = 'Extra Large (Adult)'
    TSHIRT_SIZES = (
        (XSMALL, XSMALL), (SMALL, SMALL), (MEDIUM, MEDIUM),
        (LARGE, LARGE), (XLARGE, XLARGE), (ADULTXSM, ADULTXSM),
        (ADULTSM, ADULTSM), (ADULTMD, ADULTMD), (ADULTLG, ADULTLG), (ADULTXLG, ADULTXLG)
    )
    tshirt = models.CharField('T-Shirt Size', max_length=20, blank=True, null=True, choices=TSHIRT_SIZES)
    level = models.ForeignKey('Level', blank=True, null=True)
    is_scratched = models.BooleanField('Scratched?', default=False)

    class Meta:
        verbose_name_plural = 'Gymnasts'
        verbose_name = 'Gymnast'

    def __str__(self):
        scratched = 'SCRATCHED ' if self.is_scratched else ''
        return "{3}{1}, {0} (L{2})".format(self.first_name, self.last_name, self.level, scratched)


class Level(models.Model):
    level = models.CharField(max_length=5)
    order = models.PositiveSmallIntegerField(default=0)

    class Meta:
        verbose_name = 'Level'
        verbose_name_plural = 'Levels'
        ordering = ('order',)

    def __str__(self):
        return self.level


### Receivers

@receiver(m2m_changed, sender=Team.levels.through)
def level_costs(sender, instance, **kwargs):
    instance.level_cost = instance.calc_level_cost()
    instance.total_cost = instance.level_cost + instance.gymnast_cost
    instance.save()


@receiver(post_save, sender=Gymnast)
def gymnast_costs(sender, instance, **kwargs):
    instance.team.gymnast_cost = instance.team.calc_gymnast_cost()
    instance.team.total_cost = instance.team.level_cost + instance.team.gymnast_cost
    instance.team.save()
