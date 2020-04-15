extends Node2D

onready var carousel = $Carousel;
onready var item_destination = preload("res://scenes/subscenes/carousel/items/destination.tscn");

func _ready():
	carousel.state = "input"
	for dest in Ship.port.destinations:
		var item = item_destination.instance()
		item.setText(dest.name_text)
		carousel.insert(item)
	
#	var rum = Sprite.new();
#	var wheat = Sprite.new();
#	var wood = Sprite.new();
#	rum.texture = load("res://gfx/resources/rum.png");
#	wood.texture = load("res://gfx/resources/timber.png");
#	wheat.texture = load("res://gfx/resources/wheat.png");
#
#	carousel.insert(rum);
#	carousel.insert(wood);
#	carousel.insert(wheat);

func _input(event):
	if event.is_action_pressed("ui_accept"):
		Ship.port = Ship.port.destinations[carousel.selected]
		Ship.days_to_dest = 5
		get_tree().change_scene("res://scenes/levels/open_sea.tscn")
