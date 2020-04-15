extends Control

onready var date_label = get_node("./Vbox/Top/Date");

func _ready():
	Calendar.connect("date_change",self,"_on_date_change")

func _on_date_change(date:String):
	date_label.set_text(date)
	
