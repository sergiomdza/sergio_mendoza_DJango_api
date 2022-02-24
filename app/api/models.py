from django.db import models

# Create your models here.
class MovieCategories(models.Model):
    name = models.CharField(max_length=250)

class Actors(models.Model):
    name = models.CharField(max_length=250)
    description = models.CharField(max_length=500)
    age = models.IntegerField(1)

class Directors(models.Model):
    name = models.CharField(max_length=250)
    description = models.CharField(max_length=500)
    age = models.IntegerField(1)

class Composers(models.Model):
    name = models.CharField(max_length=250)
    description = models.CharField(max_length=500)
    age = models.IntegerField(1)

class Movie(models.Model):
    name = models.CharField(max_length=250)
    description = models.CharField(max_length=500)
    ranking = models.IntegerField(1)
    category = models.ForeignKey(MovieCategories, on_delete=models.PROTECT)
    actor = models.ManyToManyField(Actors)
    directors = models.ManyToManyField(Directors)
    composers = models.ManyToManyField(Composers)
