from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^store/', include('store.urls', namespace = 'store')),
    url(r'^admin/', include(admin.site.urls)),
)
