extends Node

func link(port1, port2):
	port1.destinations.append(port2)
	port2.destinations.append(port1)
	
func _ready():
	link(PortRoyal, Tortuga)
	link(PortRoyal, Margarita)
