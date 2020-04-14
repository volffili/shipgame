extends Control

onready var item_destination = preload("res://scenes/subscenes/carousel/items/destination.tscn");
onready var carousel = $Carousel;

func _ready():
	var port_royal  = item_destination.instance();
	var tortuga = item_destination.instance();
	var margarita = item_destination.instance();
	port_royal.setText("Port Royal");
	tortuga.setText("Tortuga");
	margarita.setText("Margarita");
	carousel.insert(port_royal);
	carousel.insert(tortuga);
	carousel.insert(margarita);
