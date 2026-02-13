live;
if(player.equipment.enabled = true){
	duration -= 1;
	if(duration < 70){
		fade = 1;
	}
	else{
		fade = 0;
	}
}
if(duration <= 0){
	destroy_time += 1;
	if(destroy_time = 1){
		layer_sequence_destroy(shield_sequence);
		layer_sequence_create(global.layer_item_effects,x,y,seq_battle_quantum_shield_fade);
	}
	if(destroy_time > 0){
		with(bullet_enemy){
			if!(object_index = bullet_enemy_laser_green){
				destroy_type = 1;
				instance_destroy();
			}
		}
	}
	if(destroy_time >= 10){
		instance_destroy();
	}
}

if(fade = 1){
	image_alpha = 0.75 + cos(fade_time/2)*0.25;
	fade_time += 1;
}
else{
	fade_time = 0;
	if(abs(1-image_alpha) < 0.01){
		image_alpha = 1;
	}
	else{
		image_alpha += (1-image_alpha)/3;
	}
}

Sequence_PlayByFrame(sl);