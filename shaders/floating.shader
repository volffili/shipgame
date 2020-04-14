
shader_type canvas_item;

uniform float amount = 2.0;
uniform float speed = 2.5;

void vertex(){
	VERTEX.y += cos(TIME*speed)*cos(TIME*speed)*amount;
}
