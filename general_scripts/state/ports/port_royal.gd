extends "./base_port.gd"

func _ready():
	population = 2314
	name_text = "Port Royal"

	_init_values(true)
	var gov_str = " is " if guverner_town else " is not "
	print(name_text +  gov_str + " a guverner town")
	for commodity in stocks:
		print(commodity + " "+str(stocks[commodity]))
