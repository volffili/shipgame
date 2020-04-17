extends Node2D

onready var carousel = $Carousel;
onready var text_item = preload("res://scenes/subscenes/carousel/items/text_item.tscn");
onready var commodity = preload("res://scenes/subscenes/carousel/items/commodity.tscn");

var gfx_folder = "res://gfx/commodities/"
var gfx_files = {
	"bricks" : "bricks.png",
	"cocoa" : "cocoa.png",
	"fish" : "fish.png",
	"rum" : "rum.png",
	"timber" : "timber.png",
	"tools" : "tools.png",
	"wheat" : "wheat.png"
}

func _ready():
	carousel.radius = 200
	carousel.sin_multiplier = 0.4
	
	for key in gfx_files:
		var item = commodity.instance()
		item.set_texture(gfx_folder+gfx_files[key])
		item.set_buy_price(Ship.port.get_buy_price(key))
		item.set_sell_price(Ship.port.get_sell_price(key))
		carousel.insert(item)
