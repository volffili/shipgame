extends Control

onready var item_destination = preload("res://scenes/subscenes/carousel/items/destination.tscn");
var day_left = 1

func _process(delta):
	day_left -= delta
	if day_left < 1:
		day_left += 1
		
		Ship.calendar.next_day()
		Ship.days_to_dest -= 1
		if Ship.days_to_dest <= 0:
			get_tree().change_scene("res://scenes/levels/dock.tscn")
