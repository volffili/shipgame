extends Node2D

var select_obj = null

func set_texture(path:String):
	$Sprite.texture = load(path);
