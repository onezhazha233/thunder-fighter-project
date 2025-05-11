live;
SetSurfEnabled(surf_enabled)
if(sequence_exists(flame_lower)){
	flame_lower_sequence = layer_sequence_create(lel,x+lengthdir_x(flame_lower_x_offset-surf_x*surf_enabled,image_angle),y+lengthdir_y(flame_lower_y_offset-surf_y*surf_enabled,image_angle),flame_lower);
	layer_sequence_xscale(flame_lower_sequence,image_xscale);
	layer_sequence_yscale(flame_lower_sequence,image_yscale);
	layer_sequence_angle(flame_lower_sequence,image_angle);
}
if(sequence_exists(flame_upper)){
	flame_upper_sequence = layer_sequence_create(leu,x+lengthdir_x(flame_upper_x_offset-surf_x*surf_enabled,image_angle),y+lengthdir_y(flame_upper_y_offset-surf_y*surf_enabled,image_angle),flame_upper);
	layer_sequence_xscale(flame_upper_sequence,image_xscale);
	layer_sequence_yscale(flame_upper_sequence,image_yscale);
	layer_sequence_angle(flame_upper_sequence,image_angle);
}
if!(bullet_emitter = noone){
	bullet_emitter_inst = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER,bullet_emitter);
	bullet_emitter_inst.mark = id;
}

SetState(0)