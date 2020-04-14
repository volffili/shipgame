shader_type canvas_item;

uniform float offset;

void vertex(){
	VERTEX.y += cos(TIME*2.5+offset)*cos(TIME*2.5+offset)*2.0+sin(TIME+offset)*sin(TIME+offset)/2.0;
}

void fragment(){
	vec2 uv = UV;
	float y = 0.0;
	float x = 0.0;
	
	y = uv.y+TIME*2.5;
	x = uv.x+TIME*2.5;
	uv.y += cos(x+y)*0.005*cos(y);
	uv.x += sin(x-y)*0.005*sin(y);
	
	COLOR = texture(TEXTURE,vec2(uv.x,uv.y));
	//COLOR = texture(TEXTURE,UV);
}