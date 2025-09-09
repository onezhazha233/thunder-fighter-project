if(layer_sequence_is_finished(wingman_sequence)){
	if(layer_sequence_get_headdir(wingman_sequence) = seqdir_right){
		if(state = 1){
			SetState(2);
		}
	}
	if(state = 3){
		SetState(0);
	}
}

SetPosition(x,y)

if(layer_sequence_exists(layer_wingman,wingman_sequence)){
	layer_sequence_x(wingman_sequence,x-surf_x*surf_enabled);
	layer_sequence_y(wingman_sequence,y-surf_y*surf_enabled);
	layer_sequence_angle(wingman_sequence,image_angle);
}
if(layer_sequence_exists(layer_wingman_lower,flame_sequence)){
	layer_sequence_x(flame_sequence,x+lengthdir_x(flame_x_offset-surf_x*surf_enabled,image_angle));
	layer_sequence_y(flame_sequence,y+lengthdir_y(flame_y_offset-surf_y*surf_enabled,image_angle));
	layer_sequence_angle(flame_sequence,image_angle);
}