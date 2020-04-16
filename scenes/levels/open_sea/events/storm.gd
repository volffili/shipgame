extends Control

func _ready():
	$Carousel.insert_text("keep calm")
	$Carousel.insert_text("turn into a wave")
	$Carousel.connect("carousel_accept", self, "_on_carousel_accept")
	
func _on_carousel_accept(selected):
	match selected:
		"keep calm":
			get_tree().change_scene("res://scenes/levels/open_sea/open_sea.tscn")
		"turn into a wave":
			$Carousel.clear()
			$Carousel.insert_text("your ded")
		"your ded":
			get_tree().quit()
