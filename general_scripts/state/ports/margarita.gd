extends "./base_port.gd"


func _ready():
	population = 1407
	name_text = "Margarita"
	
	_init_values(true)
	var gov_str = " is " if guverner_town else " is not "
	print(name_text +  " a guverner town")
	for commodity in stocks:
		print(commodity + " "+str(stocks[commodity]))
