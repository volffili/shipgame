extends Control

onready var item_destination = preload("res://scenes/subscenes/carousel/items/text_item.tscn");
var elapsed_time = 0

func _process(delta):
	elapsed_time += delta
	if elapsed_time > 1:
		elapsed_time -= 1
		next_day()
		
func next_day():
	Calendar.next_day()
	Ship.days_to_dest -= 1
	if Ship.days_to_dest == 0:
		get_tree().change_scene("res://scenes/levels/dock/dock.tscn")
		
	if randf() < 0.3:
		get_tree().change_scene("res://scenes/levels/open_sea/events/storm.tscn")
