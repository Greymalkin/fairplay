from django.test import TestCase
import competition.models
import registration.models
import meet.models


class RankingTests(TestCase):
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
        bob, created = registration.models.Gymnast.objects.get_or_create(first_name="Bob",
                                                   last_name="Dole",
                                                   athlete_id="1002",
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

        # Bob

        competition.models.GymnastEvent.objects.create(meet=m,
                                                       gymnast=bob,
                                                       event=fx,
                                                       score=7.4)
        competition.models.GymnastEvent.objects.create(meet=m,
                                                       gymnast=bob,
                                                       event=vt,
                                                       score=11.6)
        competition.models.GymnastEvent.objects.create(meet=m,
                                                       gymnast=bob,
                                                       event=ph,
                                                       score=11.9)
        competition.models.GymnastEvent.objects.create(meet=m,
                                                       gymnast=bob,
                                                       event=pb,
                                                       score=11.9)
        competition.models.GymnastEvent.objects.create(meet=m,
                                                       gymnast=bob,
                                                       event=hb,
                                                       score=10.4)
        competition.models.GymnastEvent.objects.create(meet=m,
                                                       gymnast=bob,
                                                       event=sr,
                                                       score=11.0)

    def test_doppleganger(self):
        john = registration.models.Gymnast.objects.get(athlete_id=1001)
        bob = registration.models.Gymnast.objects.get(athlete_id=1002)
        self.assertNotEqual(john, bob)

    def test_same_score(self):
        john = registration.models.Gymnast.objects.get(athlete_id=1001)
        bob = registration.models.Gymnast.objects.get(athlete_id=1002)
        self.assertEqual(john.overall_score, bob.overall_score)

    def test_aa_highest_rank(self):
        john = registration.models.Gymnast.objects.get(athlete_id=1001)
        bob = registration.models.Gymnast.objects.get(athlete_id=1002)
        self.assertTrue(john.rank > bob.rank)

    def test_aa_first_place(self):
        bob = registration.models.Gymnast.objects.get(athlete_id=1002)
        self.assertEqual(bob.rank, 1)

    def test_aa_second_place(self):
        john = registration.models.Gymnast.objects.get(athlete_id=1001)
        self.assertEqual(john.rank, 2)

    def test_john_tiebreak(self):
        import math
        john = registration.models.Gymnast.objects.get(athlete_id=1001)
        events = competition.models.GymnastEvent.objects.filter(gymnast=john).order_by('score')

        tie_break = 0
        p = 0
        for event in events:
            if event.score is not None:
                tie_break += int(int(event.score * 10) * math.pow(10, p))
            p += 3
        self.assertEqual(tie_break, john.tie_break)

    def test_bob_tiebreak(self):
        import math
        bob = registration.models.Gymnast.objects.get(athlete_id=1002)
        events = competition.models.GymnastEvent.objects.filter(gymnast=bob).order_by('score')

        tie_break = 0
        p = 0
        for event in events:
            if event.score is not None:
                tie_break += int(int(event.score * 10) * math.pow(10, p))
            p += 3
        self.assertEqual(tie_break, bob.tie_break)
