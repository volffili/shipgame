extends Node2D

onready var carousel = $Carousel;
onready var text_item = preload("res://scenes/subscenes/carousel/items/text_item.tscn");
onready var commodity = preload("res://scenes/subscenes/carousel/items/commodity.tscn");

var gfx_folder = "res://gfx/commodities/"
var gfx_files = [
	"bricks.png",
	"cocoa.png",
	"fish.png",
	"rum.png",
	"timber.png",
	"tools.png",
	"wheat.png"
]

func _ready():
	carousel.radius = 200
	carousel.sin_multiplier = 0.4
	
	for file in gfx_files:
		var item = commodity.instance()
		item.set_texture(gfx_folder+file)
		carousel.insert(item)
