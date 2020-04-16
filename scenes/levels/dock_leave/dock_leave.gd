extends Node2D

onready var carousel = $Carousel;

func _ready():
	carousel.connect("carousel_accept", self, "_on_carousel_accept")
	for dest in Ship.port.destinations:
		carousel.insert_text(dest.name_text, dest)


func _on_carousel_accept(selected_port):
	Ship.port = selected_port
	Ship.days_to_dest = 5
	Calendar.next_day()
	get_tree().change_scene("res://scenes/levels/open_sea/open_sea.tscn")
