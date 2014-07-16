from django.db import models
from django.utils.html import format_html

# Create your models here.

class Item(models.Model):
	description = models.CharField(max_length = 200)
	image = models.CharField(max_length = 200)
	title = models.CharField(max_length = 100)
	price = models.IntegerField(max_length = 11)

	def item_html(self):
		return format_html('<li class="col-3 col-sm-3 col-md-3" style="height: 450px;">' 
												'<div style="height: 256px;" >'
            						'<div  style="width:190px;height:190px;display: block;border: 2px solid rgb(236, 231, 220); position: relative;overflow: hidden;">'
              					'<img src="{0}" alt="" width="200px" height="301px"  style="height: 370px;margin: -120px 0px -5px 0px;" />'
												'</div><div class="caption">'
                				'<h6 style="height:22px;">{1}</h6>'
                				'<p class="text-muted">${2}.00 </p> '
					 							'</div>'
          							'</div>'
												'<a href="#" class="btn btn-primary btn-block">'
												'Get Item &raquo;'
												'</a></li>',
												str(self.image), str(self.title), str(self.price))

	def __unicode__(self):
		return u'%s %d' % (self.title, self.price)

class Size(models.Model):
	size = models.CharField(max_length = 15)

	def __unicode__(self):
		return u" %s " % self.size

class Item_Qty(models.Model):
	profile = models.ForeignKey(Item)
	size = models.ForeignKey(Size)
	quantity = models.IntegerField(max_length = 10)
	pending = models.IntegerField(max_length = 10)

	def __unicode__(self):
		return u'%d %d %d' %  (self.profile_id, self.size_id, self.quantity)

class User(models.Model):
	f_name = models.CharField(max_length = 30)
	l_name = models.CharField(max_length = 50)
	email = models.CharField(max_length = 30)
	address = models.CharField(max_length = 100)

	def __unicode__(self):
		return u'%s %s %s %s' %  (self.f_name, self.l_name, self.email, self.address)

class Cart(models.Model):
	item = models.IntegerField(max_length = 10)
	qty = models.IntegerField(max_length = 10)
	session = models.IntegerField(max_length = 10)

	def __unicode__(self):
		return u'%d %d' %  (self.item_id)

