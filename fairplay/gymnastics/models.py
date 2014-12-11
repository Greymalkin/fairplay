from django.db import models


class LEDSign(models.Model):
    sign_id = models.PositiveSmallIntegerField(unique=True)
    device = models.CharField(max_length=255)

    def __str__(self):
        return "{}".format(self.id)

    class Meta:
        verbose_name = "LED sign"
        verbose_name_plural = "LED signs"


class Team(models.Model):
    name = models.CharField(max_length=255)
    initial_event = models.ForeignKey('Event')
    qualified = models.BooleanField(default=True, help_text="Qualifies for team awards")

    def __str__(self):
        return self.name


class Event(models.Model):
    order = models.PositiveSmallIntegerField()
    name = models.CharField(max_length=255, help_text="Event name")
    sign = models.ForeignKey(LEDSign)

    class Meta():
        ordering = ['order', ]

    def starting_teams(self):
        teams = Team.objects.filter(initial_event=self)
        return ', '.join([str(t) for t in teams])

    def starting_athletes(self):
        count = 0
        teams = Team.objects.filter(initial_event=self)
        for team in teams:
            count += len(team.athletes.all())
        return count

    def __str__(self):
        return self.name


class Group(models.Model):
    level = models.PositiveSmallIntegerField()
    age_group = models.CharField(max_length=255)

    class Meta():
        ordering = ['level', 'age_group', ]

    def __str__(self):
        return "Level {} ({}yo)".format(self.level, self.age_group)


class Session(models.Model):
    name = models.CharField(max_length=255, help_text="Session name")
    groups = models.ManyToManyField(Group)

    def __str__(self):
        return self.name


class TeamAward(models.Model):
    name = models.CharField(max_length=255)
    groups = models.ManyToManyField(Group)

    def __str__(self):
        return self.name


class Athlete(models.Model):
    athlete_id = models.PositiveSmallIntegerField(unique=True)
    last_name = models.CharField(max_length=100)
    first_name = models.CharField(max_length=100)
    team = models.ForeignKey(Team, related_name='athletes')
    group = models.ForeignKey(Group)
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
