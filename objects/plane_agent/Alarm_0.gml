SetSurfEnabled(surf_enabled)
if(sequence_exists(flame_lower)){
	flame_lower_sequence = layer_sequence_create("planes_lower",x+lengthdir_x(flame_lower_x_offset,image_angle)*image_xscale-surf_x*surf_enabled+lengthdir_x(flame_lower_y_offset,image_angle-90)*image_xscale-surf_x*surf_enabled,y+lengthdir_y(flame_lower_x_offset,image_angle)*image_yscale-surf_y*surf_enabled+lengthdir_y(flame_lower_y_offset,image_angle-90)*image_yscale-surf_y*surf_enabled,flame_lower);
	layer_sequence_xscale(flame_lower_sequence,image_xscale);
	layer_sequence_yscale(flame_lower_sequence,image_yscale);
	layer_sequence_angle(flame_lower_sequence,image_angle);
}
if(sequence_exists(flame_upper)){
	flame_upper_sequence = layer_sequence_create("planes_upper",x+lengthdir_x(flame_upper_x_offset,image_angle)*image_xscale-surf_x*surf_enabled+lengthdir_x(flame_upper_y_offset,image_angle-90)*image_xscale-surf_x*surf_enabled,y+lengthdir_y(flame_upper_x_offset,image_angle)*image_yscale-surf_y*surf_enabled+lengthdir_y(flame_upper_y_offset,image_angle-90)*image_yscale-surf_y*surf_enabled,flame_upper);
	layer_sequence_xscale(flame_upper_sequence,image_xscale);
	layer_sequence_yscale(flame_upper_sequence,image_yscale);
	layer_sequence_angle(flame_upper_sequence,image_angle);
}
if!(bullet_emitter = noone){
	bullet_emitter_inst = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER,bullet_emitter);
}

SetState(0)