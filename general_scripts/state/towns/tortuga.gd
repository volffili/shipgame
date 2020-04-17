extends "./base_port.gd"

func _ready():
	_init_values("Tortuga",Consts.AVERAGE_TOWN_POPULATION*rand_range(0.45,0.55),false)
