
shader_type canvas_item;

void vertex(){
	VERTEX.y += cos(TIME*2.5)*cos(TIME*2.5)*2.0;
}


void fragment(){
	vec2 uv = UV;
	float y = 0.0;
	float x = 0.0;
	
	y = uv.y+TIME*1.5;
	x = uv.x+TIME;
	uv.y += cos(x+y)*0.002*cos(y);
	uv.x += sin(x-y)*0.002*sin(y);
	
	COLOR = texture(TEXTURE,vec2(uv.x,uv.y));
}