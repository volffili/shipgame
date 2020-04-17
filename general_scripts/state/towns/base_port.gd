extends Node

var town_name = "Sem neco vypln kamo"
var destinations = []
var last_visit = Calendar.get_date_as_array()

var population
var guverner
var warehouse

func get_name():
	return town_name

func get_buy_price(good):
	return Goods.calc_buy_price(good,warehouse.get_stocks(good),population)

func get_sell_price(good):
	return Goods.calc_sell_price(good,warehouse.get_stocks(good),population)

func _init_values(town_name,population,guverner):
	self.population = population
	self.town_name = town_name
	self.guverner = guverner
	warehouse = Warehouse.new(population,guverner)



