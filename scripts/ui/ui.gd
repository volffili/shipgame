extends Control

onready var date_label = get_node("./Vbox/Top/Date");
onready var calendar = Calendar.new(1,1,1570);

func _ready():
	date_label.set_text(calendar.get_date_as_string());

