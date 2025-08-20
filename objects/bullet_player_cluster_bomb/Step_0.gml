live;
if(duration <= 0){
	layer_sequence_speedscale(bullet_sequence,game_get_speed(gamespeed_fps)/60);
}
if(collision_point(x,y,enemy_agent,true,true)){
	hspeed = 0;
	Anim_Destroy(id,"hspeed");
	layer_sequence_speedscale(bullet_sequence,game_get_speed(gamespeed_fps)/60);
	duration = -1;
}

if(layer_sequence_is_finished(bullet_sequence)){
	layer_sequence_destroy(bullet_sequence);
	aa = 1;
	vspeed = -22.5;
}
if(aa > 0){
	if(aa mod 3 = 1){
		effect = instance_create_depth(x+sin(aa/3)*30*scale_x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
		effect.sequence = collision_effect_sequence;
		effect.radius = collision_effect_radius*collision_effect_scale;
		effect.image_xscale = -scale_x*collision_effect_scale;
		effect.image_yscale = scale_y*collision_effect_scale;
		effect.damage = damage;
	}
	
	aa += 1;
}

duration -= 1

Sequence_PlayByFrame("bullets_player")