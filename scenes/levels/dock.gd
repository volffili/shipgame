extends Node2D

onready var carousel = $Carousel;

func _ready():
	var rum = Sprite.new();
	var wheat = Sprite.new();
	var wood = Sprite.new();
	rum.texture = load("res://gfx/resources/rum.png");
	wood.texture = load("res://gfx/resources/timber.png");
	wheat.texture = load("res://gfx/resources/wheat.png");
	
	carousel.insert(rum);
	carousel.insert(wood);
	carousel.insert(wheat);
