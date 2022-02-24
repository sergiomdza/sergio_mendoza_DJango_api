from .models import *
from rest_framework import serializers

class MovieSerializer(serializers.ModelSerializer):
    class Meta:
        model = Movie # Modelo a sacar
        fields = ['id', 'name', 'description', 'ranking', 'category', 'actor', 'directors', 'composers'] # Campos a recuperar
    

class ActorsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Actors # Modelo a sacar
        fields = ['id', 'name', 'description', 'age', ] # Campos a recuperar

class ComposersSerializer(serializers.ModelSerializer):
    class Meta:
        model = Composers # Modelo a sacar
        fields = ['id', 'name', 'description', 'age', ] # Campos a recuperar

class DirectorsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Directors # Modelo a sacar
        fields = ['id', 'name', 'description', 'age', ] # Campos a recuperar
    

class MovieCategoriesSerializer(serializers.ModelSerializer):
    class Meta:
        model = MovieCategories # Modelo a sacar
        fields = ['id', 'name'] # Campos a recuperar