extends Node

func calc_buy_price(good,stocks,population):
	return _medium_price(good,stocks,population)*(1+_price_spread(population,stocks))
	
func calc_sell_price(good,stocks,population):
	return _medium_price(good,stocks,population)*(1-_price_spread(population,stocks))
	
#specifies the range of price in ports
#price is in range(base_price/deflection,base_price*deflection)
var _deflection = 3; 

var base_price = {
	"bricks" : 50,
	"cocoa"  : 500, 
	"fish"   : 200,
	"rum"    : 400,
	"timber" : 50,
	"tools"  : 300,
	"wheat"  : 100
}

#Goods from Europe is imported to guverner towns (High stocks of import goods)
#Other colonies produce a lot of export goods (High stocks of export goods)
var export_goods = ["cocoa","rum"]
var import_goods = ["tools"]
var material     = ["timber","bricks"]
var food         = ["fish","wheat"]

#percentage difference in buy and sell price
func _price_spread(population,stocks):
	var _base_spread = 0.1
	return _base_spread*population/stocks

func _medium_price(good,stocks,population):
	if stocks == 0:
		return _highest_possible_price(good)
	var price_mod = clamp(float(stocks)/population,0.0,1.0)
	return round(lerp(_lowest_possible_price(good),_highest_possible_price(good),price_mod))

func _lowest_possible_price(good):
	return base_price[good]/_deflection
func _highest_possible_price(good):
	return base_price[good]*_deflection
