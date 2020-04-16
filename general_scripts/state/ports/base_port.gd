extends Node

var name_text = "Sem neco vypln kamo"
var destinations = []
var last_visit = Calendar.get_date_as_array()

var population = 1000
var stocks
var guverner_town

var base_price = {
	"bricks" : 50,
	"cocoa"  : 500, 
	"fish"   : 200,
	"rum"    : 400,
	"timber"   : 50,
	"tools"  : 300,
	"wheat"  : 100
}

func get_price(commodity):
	if (stocks[commodity] == 0):
		return 0
	return round(base_price[commodity] * population/stocks[commodity])

func _init_values(guverner_town):
	self.guverner_town = guverner_town
	if(guverner_town):
		_set_stocks_of_guverner_town(population)
	else:
		_set_stocks_of_colonial_town(population)

func _set_stocks_of_colonial_town(base_stock):
	stocks = {
		"fish"   : Util.randi_range(0,base_stock),
		"wheat"  : Util.randi_range(0,base_stock),
		"bricks" : Util.randi_range(0,base_stock),
		"timber"   : Util.randi_range(0,base_stock),
		
		"cocoa"  : Util.randi_range(base_stock/2,base_stock*2),#export good 
		"rum"    : Util.randi_range(base_stock/2,base_stock*2),#export good
		"tools"  : Util.randi_range(0,base_stock/4),#import good
	}

func _set_stocks_of_guverner_town(base_stock):
	stocks = {
		"fish"   : Util.randi_range(0,base_stock),
		"wheat"  : Util.randi_range(0,base_stock),
		"timber"   : Util.randi_range(0,base_stock),
		"bricks" : Util.randi_range(0,base_stock),
		
		"cocoa"  : Util.randi_range(0,base_stock/4),#export good 
		"rum"    : Util.randi_range(0,base_stock/4),#export good
		"tools"  : Util.randi_range(base_stock/2,base_stock*2),#import good
	}
