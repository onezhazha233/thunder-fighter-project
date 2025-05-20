live;
duration -= 1
if(duration < 70){
	fade = 1;
}
else{
	fade = 0;
}
if(duration <= 0){
	if(duration = 0){
		layer_sequence_destroy(shield_sequence);
		layer_sequence_create("item_effects",x,y,seq_battle_quantum_shield_fade);
	}
	with(bullet_enemy){
		destroy_type = 1;
		instance_destroy();
	}
	if(duration <= -10)instance_destroy();
}

if(fade = 1){
	image_alpha = 0.75 + cos(fade_time/2)*0.25;
	fade_time += 1;
}
else{
	fade_time = 0;
	image_alpha = 1;
}

SetPosition(x,y)

with(bullet_enemy){
	if(point_distance(x,y,other.x,other.y) <= other.shield_range){
		/*destroy_type = 3;
		a = instance_create_depth(x,y,depth,bullet_player_enemy);
		a.sprite_index = sprite_index;
		a.direction = point_direction(x,y,other.x,other.y) + 180;
		a.image_angle = a.direction;
		a.speed = speed;*/
		destroy_type = 1;
		instance_destroy();
	}
}