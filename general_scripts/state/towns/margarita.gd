extends "./base_port.gd"


func _ready():
	_init_values("Margarita",Consts.AVERAGE_TOWN_POPULATION*rand_range(0.95,1.05),true)
