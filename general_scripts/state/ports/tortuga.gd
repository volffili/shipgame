extends "./base_port.gd"

func _ready():
	population = 508
	name_text = "Tortuga"
	
	_init_values(false)
	var gov_str = " is " if guverner_town else " is not "
	print(name_text +  " a guverner town")
	for commodity in stocks:
		print(commodity + " "+str(stocks[commodity]))
