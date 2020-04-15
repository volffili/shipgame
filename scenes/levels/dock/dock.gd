extends Node2D

onready var carousel = $Carousel;
onready var text_item = preload("res://scenes/subscenes/carousel/items/text_item.tscn");

func _ready():
	carousel.insert_text("sail")
	carousel.insert_text("trade")
	carousel.insert_text("town")
