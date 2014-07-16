from django.contrib import admin
from store.models import *
#Item, Size, Item_Qty, User, Cart

# Register your models here.
class Size_Inline(admin.TabularInline):
	model = id

class Item_Qty_Inline(admin.TabularInline):
	model = Item_Qty

class Item_Inline(admin.TabularInline):
	model = Item

class Item_Qty_Admin(admin.ModelAdmin):
	fields = ['profile', 'size', 'quantity']
	list_display = ('profile', 'size', 'quantity')

admin.site.register(Item_Qty, Item_Qty_Admin)


class Item_Admin(admin.ModelAdmin):
	fieldsets = [
				(None, {'fields' : ['title']}),
				('Item Information', {'fields' : ['price', 'description', 'image']})
	]
	list_display = ('title', 'price', 'description', 'image')
	search_fields = ['title', 'description', 'image']

admin.site.register(Item, Item_Admin)

admin.site.register(Size)
