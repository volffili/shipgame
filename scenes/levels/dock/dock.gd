extends Node2D

onready var carousel = $Carousel;
onready var text_item = preload("res://scenes/subscenes/carousel/items/text_item.tscn");

func _ready():
	carousel.state = "input"

	carousel.insert_text("sail")
	carousel.insert_text("trade")
	carousel.insert_text("town")
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		Ship.port = Ship.port.destinations[carousel.selected]
		Ship.days_to_dest = 5
		get_tree().change_scene("res://scenes/levels/open_sea.tscn")
