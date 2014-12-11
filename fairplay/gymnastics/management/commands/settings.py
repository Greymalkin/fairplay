from gymnastics import models


FIRST_ROW = 1

FIRSTNAME_COL = 0
LASTNAME_COL = 1
TEAM_COL = 2
LEVEL_COL = 3
AGE_GROUP_COL = 4
ATHLETE_ID_COL = 6

# teams need to be set to an initial event.  for importing, we will set them all the same.
INITIAL_SIGN = models.LEDSign.objects.first()
if not INITIAL_SIGN:
    INITIAL_SIGN, created = models.LEDSign.objects.get_or_create(sign_id=99, device='alice')

INITAL_EVENT = models.Event.objects.first()
if not INITAL_EVENT:
    INITAL_EVENT, created = models.Event.objects.get_or_create(name='Floor', order=1, sign=INITIAL_SIGN)