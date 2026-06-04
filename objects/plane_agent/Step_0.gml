if(layer_sequence_is_finished(plane_sequence)){
	if(layer_sequence_get_headdir(plane_sequence) = seqdir_right){
		if(state = 1){
			SetState(2);
		}
	}
	if(state = 3){
		SetState(0);
	}
}

layer_sequence_blend(flame_upper_sequence,image_blend)
layer_sequence_blend(flame_lower_sequence,image_blend)
layer_sequence_blend(plane_sequence,image_blend)
layer_sequence_alpha(flame_upper_sequence,image_alpha)
layer_sequence_alpha(flame_lower_sequence,image_alpha)
layer_sequence_alpha(plane_sequence,image_alpha)