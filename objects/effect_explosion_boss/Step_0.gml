live;
time += 1
if(time = 1){
	instance_create_depth(x-50,y-60,0,effect_explosion_small);
	instance_create_depth(x+50,y-60,0,effect_explosion_small);
}
if(time = 13){
	instance_create_depth(x-50,y+60-60,0,effect_explosion_small);
	instance_create_depth(x+50,y+60-60,0,effect_explosion_small);
}
if(time = 18){
	instance_create_depth(x-50,y+100-60,0,effect_explosion_small);
	instance_create_depth(x+50,y+100-60,0,effect_explosion_small);
}
if(time = 24){
	instance_create_depth(x-50,y+100-60,0,effect_explosion_medium);
	instance_create_depth(x+50,y+100-60,0,effect_explosion_medium);
}
if(time = 30){
	instance_create_depth(x-70,y+80-60,0,effect_explosion_big);
	instance_create_depth(x+70,y+80-60,0,effect_explosion_big);
}
if(time = 36){
	instance_create_depth(x,y+40-60,0,effect_explosion_big);
}
if(time = 44){
	instance_create_depth(x,y-60,0,effect_explosion_big);
}
if(time = 62){
	instance_create_depth(x-80,y+100-60,0,effect_explosion_medium);
}
if(time = 70){
	instance_create_depth(x-50,y-60,0,effect_explosion_medium);
}
if(time = 74){
	instance_create_depth(x+50,y-60,0,effect_explosion_medium);
}
if(time = 80){
	instance_create_depth(x+80,y+100-60,0,effect_explosion_medium);
}
if(time = 85){
	instance_create_depth(x,y+150-60,0,effect_explosion_medium);
}
if(time = 90){
	instance_create_depth(x-50,y-60,0,effect_explosion_medium);
}
if(time = 96){
	instance_create_depth(x+50,y-60,0,effect_explosion_medium);
}
if(time = 106){
	instance_create_depth(x,y+70-60,0,effect_explosion_big);
}
if(time = 120){
	instance_create_depth(x-50,y-60,0,effect_explosion_small);
}
if(time = 124){
	instance_create_depth(x+50,y-60,0,effect_explosion_small);
}
if(time = 130){
	instance_create_depth(x-50,y+60-60,0,effect_explosion_small);
	instance_create_depth(x+50,y+60-60,0,effect_explosion_small);
}
if(time = 148){
	instance_create_depth(x-50,y+100-60,0,effect_explosion_small);
	instance_create_depth(x+50,y+100-60,0,effect_explosion_small);
}
if(time = 146){
	instance_create_depth(x-50,y+100-60,0,effect_explosion_medium);
	instance_create_depth(x+50,y+100-60,0,effect_explosion_medium);
}
if(time = 150){
	instance_create_depth(x-70,y+80-60,0,effect_explosion_big);
	instance_create_depth(x+70,y+80-60,0,effect_explosion_big);
}
if(time = 153){
	instance_create_depth(x,y,0,effect_explosion_big);
}
if(time = 156){
	instance_create_depth(x,y,0,effect_explosion_big);
}
if(time = 160){
	instance_create_depth(x,y,0,effect_explosion_ring_white);
	instance_create_depth(x,y,0,effect_explosion_big);
	instance_create_depth(x,y,0,effect_explosion_ring_red);
	instance_destroy();
}