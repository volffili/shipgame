extends Control

onready var date_label = get_node("./Vbox/Date");
onready var port_label = get_node("./Vbox/Port");

func _ready():
	Calendar.connect("date_change", self, "_on_date_change")
	_on_date_change(Calendar.get_date_as_string())

func _on_date_change(date:String):
	date_label.set_text(date)
	
	var port_text = ""
	if Ship.days_to_dest > 0:
		port_text = str(Ship.days_to_dest) + " days to "
	port_text += Ship.port.get_name()
	port_label.set_text(port_text)
