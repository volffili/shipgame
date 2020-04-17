extends Node2D

var select_obj = null
var price
var buy_price
var sell_price
var stocks

func set_stocks(stocks:int):
	if(stocks == 0):
		$BuyPrice.visible = false
		$SellPrice.visible = false

func set_buy_price(price:int):
	buy_price = price
	$BuyPrice.set_text(str(buy_price))
	
func set_sell_price(price:int):
	sell_price = price
	$SellPrice.set_text(str(sell_price))

func set_texture(path:String):
	$Sprite.texture = load(path);
