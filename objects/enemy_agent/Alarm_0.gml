live;
SetSurfEnabled(surf_enabled)
if(sequence_exists(flame)){
	flame_sequence = layer_sequence_create("enemies_lower",x+lengthdir_x(flame_x_offset-surf_x*surf_enabled,image_angle),y+lengthdir_y(flame_y_offset-surf_y*surf_enabled,image_angle),flame);
	layer_sequence_xscale(flame_sequence,image_xscale);
	layer_sequence_yscale(flame_sequence,image_yscale);
	layer_sequence_angle(flame_sequence,image_angle);
}
if!(bullet_emitter = noone){
	bullet_emitter_inst = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER,bullet_emitter);
}

SetState(0)