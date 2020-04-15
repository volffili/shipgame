extends Node2D

onready var carousel = $Carousel;

func _ready():
	for dest in Ship.port.destinations:
		carousel.insert_text(dest.name_text)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		Ship.port = Ship.port.destinations[carousel.selected]
		Ship.days_to_dest = 5
		get_tree().change_scene("res://scenes/levels/open_sea/open_sea.tscn")
