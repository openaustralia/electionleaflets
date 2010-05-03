from PIL import Image, ImageDraw
from django.http import HttpResponse, Http404
from django.shortcuts import render_to_response
from django.db.models import Q
from boundaries.models import Boundary
from legacy.models import Leaflet, Party
import math
import random
google_dist = 20037508.34

def leaflet_polygon_options(boundary):
    n = Leaflet.objects.filter(leafletconstituency__constituency__boundary = boundary).count()
    return {"fill": leaflet_colour(n), "outline": (0,0,0,170)}

def leaflet_popup(boundary):
    party_list = [(p, 
                   Leaflet.objects.filter(leafletconstituency__constituency__boundary = boundary, 
                                          publisher_party = p))
                  for p 
                  in Party.objects.filter(leaflet__leafletconstituency__constituency__boundary = boundary).distinct().order_by('name')]
    unclassified_leaflets = Leaflet.objects.filter(leafletconstituency__constituency__boundary = boundary, 
                                                   publisher_party = None)
    if unclassified_leaflets:
        party_list = party_list + [({"name": "Uncategorised"}, unclassified_leaflets)]
    return "leaflets.html", {"constituency": boundary.constituency,
                             "party_list": party_list
                             }

def leaflet_colour(n):
    r = math.log((n+1), 2) 
    return  (50 + r * 16, 255 - r * 32, 100 + r * 16, 32 + r * 32)

def leaflet_keyvalues():
    return [0,2,5,10,20,50,100,200]


maps = {"leaflets": {"polygon_options": leaflet_polygon_options,
                     "template": leaflet_popup,
                     "colour": leaflet_colour,
                     "keyvalues": leaflet_keyvalues()}
        }

def getDBzoom(z):
    if int(z) > 10:
        return 10
    else:
        return int(z)

def view_key(request, mapname, n, x, y):
    image = Image.new("RGBA", (int(x), int(y)), maps[mapname]["colour"](int(n)))
    response = HttpResponse(mimetype="image/png")
    image.save(response, "PNG")
    return response

def view_map(request, mapname):
    return render_to_response("map.html", {"mapname": mapname, "keyvalues":maps[mapname]["keyvalues"]})

def tile(request, mapname, tz=None, tx=None, ty=None, tilex=256, tiley = 256):
    options = maps[str(mapname)]
    west, south, east, north = getTileRect(tx, ty, tz)
    zoom = 2 ** float(tz)
    tx = float(tx)
    ty = float(ty)
    image = Image.new("RGBA", (256, 256), (0, 0, 0, 0))
    draw = ImageDraw.Draw(image)
    dbz = getDBzoom(tz)
    
    boundaries_within = Boundary.objects.filter(zoom=dbz, south__lt=north, north__gt=south, east__gt=west, west__lt=east)
    for boundary in boundaries_within:
        polygon_options = options["polygon_options"](boundary)
        coords = eval(boundary.boundary)
        l = []
        for lng, lat in coords:
            x = 256 * (lng - west) / (east - west)
            y = 256 * (lat - north) / (south - north)
            l.append((x, y))
        draw.polygon(l, **polygon_options)
    del draw
    response = HttpResponse(mimetype="image/png")
    image.save(response, "PNG")
    return response

def popup(request, mapname, x=None, y=None, z=None):
    options = maps[str(mapname)]
    x = float(x)
    y = float(y)
    dbz = getDBzoom(z)
    possible_boundaries = Boundary.objects.filter(zoom=int(dbz), south__lt=y, north__gt=y, east__gt=x, west__lt=x)
    for boundary in possible_boundaries:
        coords = eval(boundary.boundary)
        inside = False
        for (vx0, vy0), (vx1, vy1) in zip(coords, coords[1:] + coords[:1]):
            if ((vy0>y) != (vy1>y)) and (x < (vx1-vx0) * (y-vy0) / (vy1-vy0) + vx0):
                inside = not(inside)
        if inside:
            return render_to_response(*options["template"](boundary))
    raise Http404

def to_google(x, tilesAtThisZoom):
  return google_dist * (1 - 2 * float(x) / tilesAtThisZoom)

def getTileRect(xt, yt, zoomt):
           zoom = int(zoomt)
           x = int(xt)
           y = int(yt)
           tilesAtThisZoom = 2 ** zoom

           return (-to_google(x, tilesAtThisZoom), 
                   to_google(y + 1, tilesAtThisZoom), 
                   -to_google(x + 1, tilesAtThisZoom), 
                   to_google(y, tilesAtThisZoom))
