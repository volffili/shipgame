extends Node2D

var select_obj = null
var price
var buy_price
var sell_price

func set_price(price:int):
	self.price = price
	buy_price = round(price*1.25)
	sell_price = round(price*0.75)
	$BuyPrice.set_text(str(buy_price))
	$SellPrice.set_text(str(sell_price))

func set_texture(path:String):
	$Sprite.texture = load(path);
