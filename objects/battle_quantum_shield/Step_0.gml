live;

duration -= 1
if(duration < 70){
	fade = 1;
}
else{
	fade = 0;
}
if(duration <= 0){
	layer_sequence_create("item_effects",x,y,seq_battle_quantum_shield_fade);
	instance_destroy();
}


if(fade = 1){
	fade_time += 1;
	image_alpha = 0.5 + cos(fade_time/2)*0.5;
}
else{
	fade_time = 0;
	image_alpha = 1;
}

SetPosition(x,y)

with(bullet_enemy){
	if(point_distance(x,y,other.x,other.y) <= other.shield_range){
		destroy_type = 1;
		instance_destroy();
	}
}