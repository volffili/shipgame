extends Node2D

onready var text_item = preload("res://scenes/subscenes/carousel/items/text_item.tscn");

signal carousel_accept

var items := [];
var radius := 128;
var rot : float = PI;
var target_angle : float = 0;
var sin_multiplier := 0.5;
var selected := 0

func _ready():
	set_process_input(true);

func _input(event):
	if items.size() == 0:
		return
	if event.is_action_pressed("ui_accept"):
		emit_signal("carousel_accept", items[selected].select_obj)
	if event.is_action_pressed("ui_left"): 
		rotate_left();
	if event.is_action_pressed("ui_right"): 
		rotate_right();

func _process(delta):
	rot = Util.lerp_degrees(rot,target_angle,delta*10)
	_refresh_positions()

func _refresh_positions():
	for i in range(items.size()):
		var rot_i = rot+i*2*PI/items.size()+PI/2
		items[i].set_position(Vector2(cos(rot_i),sin(rot_i)*sin_multiplier)*radius)

func rotate_left():
	selected = (selected + 1) % items.size()
	target_angle = fmod((items.size()-selected) * 2*PI/items.size(), 2*PI)
	# this makes it rotate the right way with 2 items, also a nice ui feedback with 1 item
	rot -= PI/items.size()/6

func rotate_right():
	selected = (selected - 1) % items.size()
	target_angle = fmod((items.size()-selected) * 2*PI/items.size(), 2*PI)
	rot += PI/items.size()/6

func insert(item, select_obj=null):
	item.select_obj = select_obj
	items.push_back(item)
	self.add_child(item)
	_refresh_positions()
	
func insert_text(text, select_obj=null):
	if select_obj == null:
		select_obj = text
	var item = text_item.instance()
	item.set_text(text)
	insert(item, select_obj)
	
func clear():
	for item in items:
		item.queue_free()
	items = []
	rot = PI
	selected = 0
	target_angle = 0

