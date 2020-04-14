extends Node2D

func newPotion():
	var paths = ["res://gfx/health_potion.png","res://gfx/mana_potion.png","res://gfx/poison.png"];
	var potion_sprite = Sprite.new();
	potion_sprite.texture = load(paths[randi()%3]);
	self.add_child(potion_sprite);
	
func _ready():
	pass
