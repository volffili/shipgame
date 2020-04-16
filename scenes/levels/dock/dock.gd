extends Node2D

onready var carousel = $Carousel;
onready var text_item = preload("res://scenes/subscenes/carousel/items/text_item.tscn");

func _ready():
	carousel.insert_text("sail", "res://scenes/levels/dock_leave/dock_leave.tscn")
	carousel.insert_text("trade", "res://scenes/levels/dock_trade/dock_trade.tscn")
	carousel.insert_text("town", "res://scenes/levels/dock_town/dock_town.tscn")
	carousel.connect("carousel_accept", self, "_on_carousel_accept")

func _on_carousel_accept(selected):
	get_tree().change_scene(selected)
