extends Control

onready var date_label = get_node("./Vbox/Top/Date");

func _process(delta):
	date_label.set_text(Ship.calendar.get_date_as_string());

