SetSurfEnabled(surf_enabled)
if(sequence_exists(flame)){
	flame_sequence = layer_sequence_create("wingmans_lower",x+lengthdir_x(flame_x_offset,image_angle)*image_xscale-surf_x*surf_enabled+lengthdir_x(flame_y_offset,image_angle-90)*image_xscale-surf_x*surf_enabled,y+lengthdir_y(flame_x_offset,image_angle)*image_yscale-surf_y*surf_enabled+lengthdir_y(flame_y_offset,image_angle-90)*image_yscale-surf_y*surf_enabled,flame);
	layer_sequence_xscale(flame_sequence,image_xscale*(flip=1 ? -1 : 1));
	layer_sequence_yscale(flame_sequence,image_yscale);
	layer_sequence_angle(flame_sequence,image_angle);
}
if!(bullet_emitter = noone){
	bullet_emitter_inst = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER,bullet_emitter);
}

SetState(0)