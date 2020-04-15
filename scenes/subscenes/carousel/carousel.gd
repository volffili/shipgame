extends Node2D

const Util = preload("res://general_scripts/util.gd");
onready var text_item = preload("res://scenes/subscenes/carousel/items/text_item.tscn");

var items := [];
var radius := 128;
var rot : float = 0;
var target_angle : float = 0;
var sin_multiplier := 0.5;
var state := "input";
var selected := 0

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
	selected = (selected + 1) % items.size()
	target_angle = rot + 2*PI/items.size();
	
func rotate_right():
	state = "interpolating";
	selected = (selected - 1) % items.size()
	target_angle = rot - 2*PI/items.size();
	
func insert(item):
	items.push_back(item);
	self.add_child(item);
	_refresh_positions();
	
func insert_text(text):	
	var item = text_item.instance()
	item.setText(text)
	insert(item)

