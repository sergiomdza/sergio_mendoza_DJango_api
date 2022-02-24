from django.shortcuts import render
from django.http import HttpResponse

from rest_framework import viewsets
from rest_framework import permissions
from rest_framework import filters
from .serializers import *
from .models import *

# Create your views here.

def index(request):
    return HttpResponse("Hello world! A ver")


class MovieViewSet(viewsets.ModelViewSet):
    search_fields = ["name", "description"]
    filter_backends = (filters.SearchFilter)
    queryset = Movie.objects.all()
    serializer_class = MovieSerializer

class MovieCategoriesViewSet(viewsets.ModelViewSet):
    search_fields = ["name"]
    filter_backends = (filters.SearchFilter)
    queryset = MovieCategories.objects.all()
    serializer_class = MovieCategoriesSerializer

class ActorsViewSet(viewsets.ModelViewSet):
    search_fields = ["name"]
    filter_backends = (filters.SearchFilter)
    queryset = Actors.objects.all()
    serializer_class = ActorsSerializer

class DirectorsViewSet(viewsets.ModelViewSet):
    search_fields = ["name"]
    filter_backends = (filters.SearchFilter)
    queryset = Directors.objects.all()
    serializer_class = DirectorsSerializer


class ComposersViewSet(viewsets.ModelViewSet):
    search_fields = ["name"]
    filter_backends = (filters.SearchFilter)
    queryset = Composers.objects.all()
    serializer_class = ComposersSerializer