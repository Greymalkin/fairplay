from meet.models import Meet


def active_meet(request):
    try:
        meet = Meet.objects.get(is_current_meet=True)[:1]
    except Exception:
        meet = None
    c = {'active_meet': meet}
    return c
