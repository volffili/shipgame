extends Node2D

func set_texture(path:String):
	$Sprite.texture = load(path);
