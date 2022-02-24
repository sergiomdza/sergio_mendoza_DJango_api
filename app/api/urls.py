from django.urls import include, path
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'movies', views.MovieViewSet)
router.register(r'moviescategories', views.MovieCategoriesViewSet)
router.register(r'actors', views.ActorsViewSet)
router.register(r'directors', views.DirectorsViewSet)
router.register(r'composers', views.ComposersViewSet)

urlpatterns = [
    # path('', views.index, name='index')
    path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]