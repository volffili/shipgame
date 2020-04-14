extends Node2D

const Util = preload("util.gd");
onready var item_destination = preload("res://scenes/subscenes/carousel/items/destination.tscn");

var items := [];
var radius := 128;
var rot : float = 0;
var target_angle : float = 0;
var sin_multiplier := 0.5;
var state := "input";

func _ready():
	set_process_input(true);

func _input(event):
	if(state != "input"):
		return;
		
	if event.is_action("ui_left"): 
		rotate_left();
	if event.is_action("ui_right"): 
		rotate_right();

func _process(delta):
	match(state):
		"interpolating":
			rot = Util.lerp_degrees(rot,target_angle,delta*10);
			if (abs(target_angle-rot) < 0.01):
				rot = fmod(target_angle,2*PI);
				state = "input";
			_refresh_positions();

func _refresh_positions():
	for i in range(items.size()):
		var rot_i = rot+i*2*PI/items.size()+PI/2; 	
		items[i].set_position(Vector2(cos(rot_i),sin(rot_i)*sin_multiplier)*radius);

func rotate_left():
	state = "interpolating";
	target_angle = rot + 2*PI/items.size();
	
func rotate_right():
	state = "interpolating";
	target_angle = rot - 2*PI/items.size();
	
func insert(item):
	items.push_back(item);
	self.add_child(item);
	_refresh_positions();
