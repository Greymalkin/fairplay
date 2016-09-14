from django.db import models
from django.db.models.signals import post_save, m2m_changed
from django.dispatch import receiver

from meet.models import Meet, MeetManager

class Team(models.Model):
    meet = models.ForeignKey(Meet, related_name='teams')
    gym = models.CharField(max_length=100, help_text="ex. Fairland Boys Gymnastics")
    team = models.CharField(max_length=100, blank=True, default="", help_text="ex. Fairland")
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
    team_awards = models.ManyToManyField('competition.TeamAward', blank=True, related_name='teams', verbose_name="Team Awards Levels")
    started = models.DateTimeField('Form Started', auto_now_add=True)
    updated = models.DateTimeField('Form Last Updated', auto_now=True)
    paid_in_full = models.BooleanField('Paid In Full?', default=False)
    notes = models.TextField(blank=True, null=True)
    qualified = models.BooleanField(default=True, help_text="Qualifies for team awards")

    objects = MeetManager()

    class Meta:
        verbose_name = 'Team'
        verbose_name_plural = 'Teams'
        ordering = ('gym',)

    def __str__(self):
        return '{0}'.format(self.gym)

    def contact_name(self):
        return '{} {}'.format(self.first_name, self.last_name)

    #TODO: add a property that makes a number for team_awards


    #TODO: add a property that figures out if this team qualifies for team awards


    #TODO: add a property that reports if this team is paid in full


class Registration(models.Model):
    meet = models.ForeignKey(Meet, related_name="registrations")
    team = models.ForeignKey(Team, related_name="registrations")
    received = models.DateField(blank=False, null=False)
    team_awards = models.ManyToManyField(
        'competition.TeamAward',
        blank=True,
        related_name='registrations',
        verbose_name="Team Awards")
    per_level_cost = models.ForeignKey('LevelPricing', null=True, blank=False)
    per_gymnast_cost = models.ForeignKey('GymnastPricing', null=True, blank=False)
    gymnast_cost = models.DecimalField('Total Gymnast Cost', decimal_places=2, max_digits=6, default=0)
    level_cost = models.DecimalField('Level Cost', decimal_places=2, max_digits=6, default=0)
    total_cost = models.DecimalField('Total Registration Cost', decimal_places=2, max_digits=6, default=0)
    paid_in_full = models.BooleanField('Paid In Full?', default=False)
    notes = models.TextField(blank=True, null=True)

    objects = MeetManager()

    class Meta:
        verbose_name_plural = "Registrations"
        verbose_name = "Registration"
        unique_together = ('team', 'received')

    def __str__(self):
        return '{0} {1}'.format(self.team.gym, self.received.strftime('%m/%d/%Y'))

    def calc_total_cost(self):
        return self.gymnast_cost + self.level_cost

    def calc_gymnast_cost(self):
        try:
            num_gymnasts = self.gymnasts.filter(is_scratched=False).count()
            if num_gymnasts > 0:
                self.gymnast_cost = self.per_gymnast_cost.price * num_gymnasts
            else:
                self.gymnast_cost = 0
            return self.gymnast_cost
        except:
            return 0

    def calc_level_cost(self):
        try:
            num_levels = self.team_awards.count()
            if num_levels > 0:
                self.level_cost = self.per_level_cost.price * num_levels
            else:
                self.level_cost = 0
            return self.level_cost
        except:
            return 0


class Person(models.Model):
    first_name = models.CharField('First Name', max_length=100)
    last_name = models.CharField('Last Name', max_length=100)
    usag = models.CharField('USAG #', max_length=225, blank=True, null=True)
    is_flagged = models.BooleanField('Flagged!', default=False)
    is_verified = models.BooleanField('Verified', default=False)
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
    meet = models.ForeignKey(Meet, related_name='coaches')
    team = models.ForeignKey(Team, related_name="coaches")
    usag_expire_date = models.DateField('USAG Expires', blank=True, null=True)
    safety_expire_date = models.DateField('Safety Expires', blank=True, null=True)
    background_expire_date = models.DateField('Background Expires', blank=True, null=True)

    objects = MeetManager()

    class Meta:
        verbose_name_plural = 'Coaches'
        verbose_name = 'Coach'


class Gymnast(Person):
    meet = models.ForeignKey(Meet, related_name='gymnasts')
    team = models.ForeignKey(Team, related_name="gymnasts", blank=True, null=True)
    registration = models.ForeignKey(Registration, related_name="gymnasts")
    dob = models.DateField(blank=True, null=True)
    age = models.PositiveSmallIntegerField('Age', blank=True, null=True, help_text='Competitive Age (as of 9/1)')
    is_us_citizen = models.BooleanField('US Citizen?', default=True)
    shirt = models.ForeignKey('ShirtSize', blank=True, null=True)
    level = models.ForeignKey('Level', blank=True, null=True)
    is_scratched = models.BooleanField('Scratched?', default=False)
    division = models.ForeignKey('competition.Division', related_name='athletes', blank=True, null=True)
    starting_event = models.ForeignKey('competition.Event', null=True, blank=True)
    overall_score = models.FloatField(null=True, blank=True)
    tie_break = models.BigIntegerField(null=True, blank=True)
    rank = models.PositiveSmallIntegerField(null=True, blank=True)
    athlete_id = models.PositiveSmallIntegerField(blank=True, null=True, verbose_name='Athlete ID', help_text='For use during competition')

    objects = MeetManager()

    class Meta:
        verbose_name_plural = 'Gymnasts'
        verbose_name = 'Gymnast'
        ordering = ('athlete_id', 'last_name', 'first_name', )
        unique_together = ('meet', 'athlete_id')

    def __str__(self):
        flagged = 'FLAGGED! ' if self.is_flagged else ''
        flagged = 'SCRATCHED ' if self.is_scratched else flagged
        usag = self.usag if self.usag and len(self.usag.strip()) else ''
        return "{3}{1}, {0} (L{2}) {4}".format(self.first_name, self.last_name, self.level, flagged, usag)

    def save(self, *args, **kwargs):
        # Roll up the team from the gymnast's registration property. 
        # Allows reverse access to gymnast directly from team
        self.team = self.registration.team
        super(Gymnast, self).save(*args, **kwargs)


class Level(models.Model):
    meet = models.ForeignKey(Meet, related_name='levels')
    level = models.CharField(max_length=5)
    order = models.PositiveSmallIntegerField(default=0)

    objects = MeetManager()

    class Meta:
        verbose_name = 'Level'
        verbose_name_plural = 'Levels'
        ordering = ('order',)

    def __str__(self):
        return self.level


class GymnastPricing(models.Model):
    meet = models.ForeignKey(Meet, related_name='gymnast_pricing')
    price = models.PositiveSmallIntegerField(default=0)
    name = models.CharField(max_length=100)

    objects = MeetManager()

    class Meta:
        verbose_name = 'Gymnast Pricing'
        verbose_name_plural = 'Gymnast Pricing'
        ordering = ['name']

    def __str__(self):
        return self.name


class LevelPricing(models.Model):
    meet = models.ForeignKey(Meet, related_name='level_pricing')
    price = models.PositiveSmallIntegerField(default=0)
    name = models.CharField(max_length=100)

    objects = MeetManager()

    class Meta:
        verbose_name = 'Level Pricing'
        verbose_name_plural = 'Level Pricing'
        ordering = ['name']

    def __str__(self):
        return self.name


class ShirtSize(models.Model):
    name = models.CharField(max_length=50)
    order = models.PositiveSmallIntegerField(default=0)

    class Meta:
        verbose_name = 'Shirt Size'
        verbose_name_plural = 'Shirt Sizes'
        ordering = ['order']

    def __str__(self):
        return self.name


### Receivers

@receiver(m2m_changed, sender=Registration.team_awards.through)
def level_costs(sender, instance, **kwargs):
    instance.level_cost = instance.calc_level_cost()
    instance.total_cost = instance.level_cost + instance.gymnast_cost
    instance.save()

    # Teams can have multiple registrations.  Team Awards from all regisrations 
    # roll up to the Team model
    for t in instance.team.team_awards.all():
        instance.team.team_awards.remove(t)

    for r in instance.team.registrations.all():        
        for t in r.team_awards.all():
            r.team.team_awards.add(t)
        r.team.save()


@receiver(post_save, sender=Gymnast)
def gymnast_costs(sender, instance, **kwargs):
    instance.registration.gymnast_cost = instance.registration.calc_gymnast_cost()
    instance.registration.total_cost = instance.registration.level_cost + instance.registration.gymnast_cost
    instance.registration.save()



