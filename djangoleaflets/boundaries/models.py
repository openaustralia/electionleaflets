from django.db import models
from legacy.models import Constituency

class Boundary(models.Model):
    constituency = models.ForeignKey(Constituency)
    boundary = models.TextField()
    zoom = models.IntegerField()

    north = models.FloatField()
    south = models.FloatField()
    east = models.FloatField()
    west = models.FloatField()

