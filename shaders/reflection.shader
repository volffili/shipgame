shader_type canvas_item;

uniform float alpha = 0.1;

void vertex(){
	VERTEX.y -= cos(TIME*2.5)*cos(TIME*2.5);
}


void fragment(){
	vec2 uv = UV;
	float y = 0.0;
	float x = 0.0;
	
	y = uv.y+TIME*2.5;
	x = uv.x+TIME*2.5;
	uv.y += cos(x+y)*0.002*cos(y);
	uv.x += sin(x-y)*0.007*sin(y);
	
	
	vec4 tex = texture(TEXTURE,vec2(uv.x,1.0-uv.y));
	float average = (tex.r+tex.g+tex.b)/3.0;
	COLOR = vec4(average/1.3,average/1.2,average,(1.0-uv.y*alpha)*tex.a);
}