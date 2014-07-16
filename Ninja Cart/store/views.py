from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.template import RequestContext, loader
from django.core.urlresolvers import reverse
from store.models import Item, Item_Qty, Size, User, Cart
from django.contrib import messages

DANGER = 50

def index(request):
		item_list = Item.objects.all()
		context = { 'items' : item_list }
		return render(request, 'store/item.html', context)

def detail(request, item_id):
	try:
			profile = Item.objects.get(pk = item_id)
	except Item_Profile.DoesNotExist:
		raise Http404
	options = Size.objects.all()
	for o in options:
		item = Item_Qty.objects.filter(profile_id = item_id, size = o.id)
		if not item:
			o.stat = 'disabled="disabled"'
		else:
			o.stat = ''
	return render(request, 'store/item.html', {'profile' : profile, 'options' : options})

def add(request, item_id):
		i = get_object_or_404(Item, pk = item_id)
		try:
			item = Item_Qty.objects.get(profile_id = item_id, size = request.POST['size'])
			item.quantity -= 1
			item.pending += 1
			try:
				check = Cart.objects.get(item = item.id)
				check.qty +=1
				check.save()
			except Cart.DoesNotExist:
				c = Cart(item = item.id, qty = 1)
				c.save()
			item.save()
			messages.success(request, 'Item was added to your cart.')
		except (KeyError, Item.DoesNotExist):
			messages.warning(request, 'That item does not exist.')
		return HttpResponseRedirect(reverse('store:index'))

def cart(request):
	total = 0
	subtotal = 0
	items = Cart.objects.all()
	for i in items:
		num = []
		count = 1
		info = Item_Qty.objects.get(id = i.item)
		number = info.quantity
		size = Size.objects.get(id = info.size_id)
		i.size = size.size
		more = Item.objects.get(id = info.profile_id)
		i.title = more.title
		i.price = more.price
		i.total = int(more.price) * int(i.qty)
		subtotal += i.total
	total = subtotal + 10
	return render(request, 'store/cart.html', {'items' : items, 'total' : total, 'subtotal' : subtotal})


def remove(request, item_id):
	qty = 0
	item = Cart.objects.get(item = item_id)
	qty = item.qty
	profile = Item_Qty.objects.get(id = item_id)
	profile.quantity += qty
	profile.pending -= qty
	profile.save()
	item.delete()
	messages.warning(request, 'Item(s) have been removed from your cart')
	return HttpResponseRedirect(reverse('store:cart'))