extends Node
class_name Warehouse

var stocks = {}

func _init(stocks,guverner):
	set_stocks(stocks,guverner)
	
func get_stocks(good):
	return stocks[good]

func set_stocks(stocks,guverner):
	_set_stocks_category(stocks/2,stocks*3/2,Goods.material)
	_set_stocks_category(stocks/2,stocks*3/2,Goods.food)
	if(guverner):
		_set_stocks_category(0,stocks,Goods.export_goods)
		_set_stocks_category(stocks,stocks*2,Goods.import_goods)
	else:
		_set_stocks_category(stocks,stocks*2,Goods.export_goods)
		_set_stocks_category(0,stocks,Goods.import_goods)

func _set_stocks_category(min_stocks,max_stocks,category):
	for good in category:
		self.stocks[good] = round(rand_range(min_stocks,max_stocks))
