from django.test import TestCase
import competition.models
import registration.models
import meet.models


class GymnastTests(TestCase):
    def setUp(self):
        m, created = meet.models.Meet.objects.get_or_create(name="1", short_name="1", host="1", date="2016-12-1")
        t, created = registration.models.Team.objects.get_or_create(meet=m,
                                                                    team="Team One",
                                                                    gym="Gym Team One",
                                                                    first_name="Alice",
                                                                    last_name="Whodafyc")
        l, created = registration.models.Level.objects.get_or_create(meet=m,
                                                                     name="Level 1",
                                                                     group="1",
                                                                     level="1")
        john, created = registration.models.Gymnast.objects.get_or_create(first_name="John",
                                                   last_name="Doe",
                                                   athlete_id="1001",
                                                   meet=m,
                                                   team=t,
                                                   level=l)
        fx, created = competition.models.Event.objects.get_or_create(meet=m,
                                                                     initials="fx",
                                                                     name="fx",
                                                                     order=0)
        vt, created = competition.models.Event.objects.get_or_create(meet=m,
                                                                     initials="vt",
                                                                     name="vt",
                                                                     order=0)
        ph, created = competition.models.Event.objects.get_or_create(meet=m,
                                                                     initials="ph",
                                                                     name="ph",
                                                                     order=0)
        pb, created = competition.models.Event.objects.get_or_create(meet=m,
                                                                     initials="pb",
                                                                     name="pb",
                                                                     order=0)
        hb, created = competition.models.Event.objects.get_or_create(meet=m,
                                                                     initials="hb",
                                                                     name="hb",
                                                                     order=0)
        sr, created = competition.models.Event.objects.get_or_create(meet=m,
                                                                     initials="sr",
                                                                     name="sr",
                                                                     order=0)
        # John

        competition.models.GymnastEvent.objects.create(meet=m,
                                                       gymnast=john,
                                                       event=fx,
                                                       score=7.5)
        competition.models.GymnastEvent.objects.create(meet=m,
                                                       gymnast=john,
                                                       event=vt,
                                                       score=11.5)
        competition.models.GymnastEvent.objects.create(meet=m,
                                                       gymnast=john,
                                                       event=ph,
                                                       score=11.9)
        competition.models.GymnastEvent.objects.create(meet=m,
                                                       gymnast=john,
                                                       event=pb,
                                                       score=11.9)
        competition.models.GymnastEvent.objects.create(meet=m,
                                                       gymnast=john,
                                                       event=hb,
                                                       score=10.4)
        competition.models.GymnastEvent.objects.create(meet=m,
                                                       gymnast=john,
                                                       event=sr,
                                                       score=11.0)

    def test_tie_break(self):
        john = registration.models.Gymnast.objects.get(athlete_id=1001)
        tiebreak = john.compute_tie_break()
        self.assertEqual(tiebreak, 119119115110104075)
