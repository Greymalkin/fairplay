from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.decorators import detail_route
from rest_framework.permissions import IsAuthenticated
from . import models, serializers


def get_current_meet_count():
    return models.Meet.objects.filter(is_current_meet=True).count()


def get_current_meet_id():
    return models.Meet.objects.filter(is_current_meet=True).values_list('id', flat=True)


def get_current_meet_name():
    try:
        name = models.Meet.objects.filter(is_current_meet=True).values_list('short_name', flat=True)[0]
    except Exception:
        name = 'NO ACTIVE MEET'
    return name


class MeetViewSet(viewsets.ReadOnlyModelViewSet):
    """ Retrieve a meet by its id """
    queryset = models.Meet.objects.all()
    serializer_class = serializers.MeetSerializer
    permission_classes = (IsAuthenticated,)

    @detail_route(methods=['get'], url_path="set")
    def set_active(self, request, pk=None):
        """ Sets a meet as active, storing it in the user's session
        ---
        omit_serializer: true
        """
        try:
            models.Meet.objects.all().exclude(id=int(pk)).update(is_current_meet=False, enable_ranking=False)
            meet = models.Meet.objects.get(id=int(pk))
            meet.is_current_meet = True
            meet.save()
        except Exception:
            request.session['meet'] = {}
            return Response({"status": "active meet cleared"}, status=status.HTTP_200_OK)

        request.session['meet'] = {
            'id': meet.id,
            'name': meet.name,
            'short_name': meet.short_name
        }
        return Response({"status": "active meet: {}".format(request.session['meet'])}, status=status.HTTP_200_OK)

    @detail_route(methods=['get'])
    def toggle_ranking(self, request, pk=None):
        """ Changes the enable_ranking flag to its opposite
        ---
        omit_serializer: true
        """
        try:
            meet = models.Meet.objects.get(id=int(pk))
            meet.enable_ranking = not meet.enable_ranking
            meet.save()
        except Exception:
            request.session['meet'] = {}
            return Response({"status": "no change to enable ranking"}, status=status.HTTP_200_OK)

        return Response({"status": "enable ranking flag changed to {}".format(meet.enable_ranking)}, status=status.HTTP_200_OK)
