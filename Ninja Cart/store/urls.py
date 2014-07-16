from django.conf.urls import patterns, url

from store import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    # ex: /item/5/
    url(r'^(?P<item_id>\d+)/$', views.detail, name='detail'),
    # ex: /polls/5/results/
    url(r'^(?P<item_id>\d+)/add/$', views.add, name='add'),
    # ex: /polls/5/vote/
    url(r'^cart/$', views.cart, name='cart'),
    url(r'^(?P<item_id>\d+)/remove/$', views.remove, name='remove'),
)