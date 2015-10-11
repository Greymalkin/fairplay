from django.db import models
from meet.models import Meet
from registration.models import Team, Gymnast, Level
from . import ranking


class LEDSign(models.Model):
    sign_id = models.PositiveSmallIntegerField(unique=True)
    device = models.CharField(max_length=255)

    def __str__(self):
        return "{}".format(self.id)

    class Meta:
        verbose_name = "LED sign"
        verbose_name_plural = "LED signs"


class Event(models.Model):
    meet = models.ForeignKey(Meet, related_name='events')
    order = models.PositiveSmallIntegerField()
    name = models.CharField(max_length=255, help_text="Event name")
    initials = models.CharField(max_length=2, help_text="Event initials")
    sign = models.ForeignKey(LEDSign)

    class Meta():
        ordering = ['order', ]

    def __str__(self):
        return self.name


class Division(models.Model):
    meet = models.ForeignKey(Meet, related_name='divisions')
    level = models.ForeignKey(Level)
    name = models.CharField(max_length=50)
    min_age = models.PositiveSmallIntegerField(default=6)
    max_age = models.PositiveSmallIntegerField(default=18)

    class Meta():
        ordering = ['level', 'min_age', ]

    def __str__(self):
        age = self.min_age
        if self.min_age != self.max_age:
            age = '{}-{}'.format(self.min_age, self.max_age)
        return "Level {} ({} years)".format(self.level, age)

    def age_division(self):
        age_division = self.min_age
        if self.min_age != self.max_age:
            age_division = '{}-{}'.format(self.min_age, self.max_age)
        return age_division        


class Session(models.Model):
    meet = models.ForeignKey(Meet, related_name='sessions')
    name = models.CharField(max_length=255, help_text="Session name")
    divisions = models.ManyToManyField(Division, related_name='session')

    def __str__(self):
        return self.name

    class Meta():
        ordering = ['name', ]


class TeamAward(models.Model):
    meet = models.ForeignKey(Meet, related_name='team_awards')
    name = models.CharField(max_length=255)
    award_percentage = models.FloatField(default=0.66)
    divisions = models.ManyToManyField(Division)

    def __str__(self):
        return self.name


class TeamAwardRank(models.Model):
    team = models.ForeignKey(Team)
    team_award = models.ForeignKey(TeamAward)
    rank = models.PositiveSmallIntegerField(null=True)
    score = models.FloatField(null=True)


class AthleteEvent(models.Model):
    athlete = models.ForeignKey(Gymnast, related_name="events")
    event = models.ForeignKey(Event, related_name="athletes")
    score = models.FloatField(null=True, blank=True)
    rank = models.PositiveSmallIntegerField(null=True)

    class Meta():
        ordering = ['athlete', 'event']
        unique_together = ('athlete', 'event',)

    def __str__(self):
        return "{} - {} - {}".format(
            self.athlete,
            self.event,
            self.score)


# class Athlete(models.Model):
#     usag_id = models.CharField(max_length=20, unique=True, blank=True, null=True, verbose_name='USAG ID')
#     athlete_id = models.PositiveSmallIntegerField(unique=True, verbose_name='Athlete ID')
#     last_name = models.CharField(max_length=100)
#     first_name = models.CharField(max_length=100)
#     birth_date = models.DateField(null=True, blank=True)
#     team = models.ForeignKey(Team, related_name='athletes')
#     group = models.ForeignKey(Group, related_name='athletes')
#     position = models.PositiveSmallIntegerField(default=0)
#     starting_event = models.ForeignKey(Event, null=True, blank=True)
#     overall_score = models.FloatField(null=True)
#     rank = models.PositiveSmallIntegerField(null=True)
#     scratched = models.BooleanField(default=False)

#     class Meta():
#         ordering = ['last_name', 'first_name', ]

#     def session(self):
#         return ""

#     def __str__(self):
#         return "{} {}, {} ({})".format(self.athlete_id, self.last_name, self.first_name, self.team)


class Message(models.Model):
    name = models.CharField(max_length=255)
    message = models.TextField()

    def __str__(self):
        return self.name


def populate_athlete(instance, created, raw, **kwargs):
    # Ignore fixtures and saves for existing courses.
    if not created or raw:
        return

    instance.save()

    for event in Event.objects.all():
        ae = AthleteEvent.objects.get_or_create(event=event, athlete=instance)
        if instance.scratched:
            ae.score = 0
            ae.save()


def populate_event(instance, created, raw, **kwargs):
    # Ignore fixtures and saves for existing courses.
    if not created or raw:
        return

    instance.save()

    for athlete in Athlete.objects.all():
        ae = AthleteEvent.objects.get_or_create(event=instance, athlete=athlete)
        if athlete.scratched:
            ae.score = 0
            ae.save()


def scratch_athlete(instance, created, raw, **kwargs):
    if instance.scratched:
        ae = instance.events.all().exclude(score__isnull=False)
        ae.update(score=0)


def update_rankings(sender, instance, created, raw, using, update_fields, **kwargs):
    if update_fields is None or 'rank' not in update_fields:
        ranking.update_group_ranking(instance.athlete.group)
        ranking.update_team_ranking()


# models.signals.post_save.connect(
#     scratch_athlete,
#     sender=Athlete,
#     dispatch_uid='scratch_athlete')


# models.signals.post_save.connect(
#     populate_athlete,
#     sender=Athlete,
#     dispatch_uid='populate_athlete')

# models.signals.post_save.connect(
#     populate_event,
#     sender=Event,
#     dispatch_uid='populate_event')

# models.signals.post_save.connect(
#     update_rankings,
#     sender=AthleteEvent,
#     dispatch_uid='update_rankings')
