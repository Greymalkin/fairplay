from django.db import models


class MeetNaturalKeyManager(models.Manager):
    def get_by_natural_key(self, name):
        return self.get(name=name)


class Meet(models.Model):
    name = models.CharField(max_length=200, blank=False, null=False)
    short_name = models.CharField(max_length=100, blank=False, null=False)
    host = models.CharField(max_length=200, default='', null=False)
    date = models.DateField(blank=True, null=True)
    is_current_meet = models.BooleanField('Current Meet?', default=False)
    enable_ranking = models.BooleanField(
        'Ranking',
        default=False,
        help_text='''scoring is live, gymnast and team ranks are adjusting as new scores come in.''')
    event_award_percentage = models.FloatField(default=0.45)
    all_around_award_percentage = models.FloatField(default=0.5)
    all_last_place_ties_in_awards = models.BooleanField(
        default=False,
        help_text="push out award count on tie at last place")
    notes = models.TextField(null=True, blank=True)

    objects = MeetNaturalKeyManager()

    class Meta:
        verbose_name = 'Meet'
        verbose_name_plural = 'Meets'
        ordering = ('-is_current_meet', 'name')

    def __str__(self):
        return '{}'.format(self.short_name)

    def natural_key(self):
            return (self.name, )


# Restrict display of items in the admin by those belonging to the current Meet

class MeetManager(models.Manager):
    def get_queryset(self):
        qs = super(MeetManager, self).get_queryset()

        try:
            current_meet = Meet.objects.get(is_current_meet=True)
            return qs.filter(meet=current_meet)
        except Exception:
            pass
        return qs
