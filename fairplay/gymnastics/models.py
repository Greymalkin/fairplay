from django.db import models


class LEDSign(models.Model):
    sign_id = models.PositiveSmallIntegerField(unique=True)
    device = models.CharField(max_length=255)

    def __str__(self):
        return "{}".format(self.id)

    class Meta:
        verbose_name = "LED sign"
        verbose_name_plural = "LED signs"


class Level(models.Model):
    level = models.PositiveSmallIntegerField()
    show_difficulty = models.BooleanField(default=False)

    def __str__(self):
        return "{}".format(self.level)


class Event(models.Model):
    order = models.PositiveSmallIntegerField()
    name = models.CharField(max_length=255, help_text="Event name")
    sign = models.ForeignKey(LEDSign)

    class Meta():
        ordering = ['order', ]

    def __str__(self):
        return self.name


class Team(models.Model):
    name = models.CharField(max_length=255)
    initial_event = models.ForeignKey(Event)

    def __str__(self):
        return self.name


class AgeGroup(models.Model):
    group = models.CharField(max_length=255)

    def __str__(self):
        return self.group


class Athlete(models.Model):
    athlete_id = models.PositiveSmallIntegerField(unique=True)
    last_name = models.CharField(max_length=30)
    first_name = models.CharField(max_length=30)
    team = models.ForeignKey(Team, related_name='athletes')
    level = models.ForeignKey(Level)
    age_group = models.ForeignKey(AgeGroup)
    position = models.PositiveSmallIntegerField(default=0)

    class Meta():
        ordering = ['athlete_id', ]

    def __str__(self):
        return "{} {}, {} ({})".format(self.athlete_id, self.last_name, self.first_name, self.team)


class AthleteEvent(models.Model):
    athlete = models.ForeignKey(Athlete, related_name="events")
    event = models.ForeignKey(Event, related_name="athletes")
    difficulty_score = models.FloatField(null=True, blank=True)
    execution_score = models.FloatField(null=True, blank=True)

    class Meta():
        ordering = ['athlete', 'event']
        unique_together = ('athlete', 'event',)

    def __str__(self):
        return "{} - {} - {}".format(
            self.athlete,
            self.event,
            self.total_score())

    def total_score(self):
        if self.difficulty_score is None:
            if self.execution_score is None:
                return None
            else:
                return self.execution_score
        else:
            if self.execution_score is None:
                return None
            else:
                return self.execution_score + self.difficulty_score


def populate_athlete(instance, created, raw, **kwargs):
    # Ignore fixtures and saves for existing courses.
    if not created or raw:
        return

    instance.save()

    for event in Event.objects.all():
        AthleteEvent.objects.get_or_create(event=event, athlete=instance)


def populate_event(instance, created, raw, **kwargs):
    # Ignore fixtures and saves for existing courses.
    if not created or raw:
        return

    instance.save()

    for athlete in Athlete.objects.all():
        AthleteEvent.objects.get_or_create(event=instance, athlete=athlete)


models.signals.post_save.connect(
    populate_athlete,
    sender=Athlete,
    dispatch_uid='populate_athlete')

models.signals.post_save.connect(
    populate_event,
    sender=Event,
    dispatch_uid='populate_event')
