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

SetPosition(x,y)