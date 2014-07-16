{% extends 'base.html' %}
{% block content %}


{% for item in items %}
<form action="{{url_for('store')}}" method="post" name="test{{item.id}}">
{{item.title}} {{item.id}} <br>
{{form.size}}{{form.item}} <br><br>
<div class="btn-grou"> 
              			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Sizes <span class="caret"></span> </button>
              				<ul class="dropdown-menu" role="menu">
              					{% for size in sizes %}
              					<li><a href="#" value="{{size.id}}"> {{size.size}} </a></li>
              					{% endfor %}
              				</ul>
								<button type="submit" class="btn btn-primary" >Add to Cart</button>
<p> <input type='submit' value="submit"></p>
</form>
{% endfor %}
{% endblock %}