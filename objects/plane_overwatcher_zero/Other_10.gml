live;
event_inherited();

SetState = function(s){
	if(rampage_mode = 0){
		rampage_intro = rampage_intro_list[0];
		rampage = rampage_list[0];
		rampage_outro = rampage_outro_list[0];
	}
	else{
		rampage_intro = rampage_intro_list[1];
		rampage = rampage_list[1];
		rampage_outro = rampage_outro_list[1];
	}

	state = s;
	if(s = 0){
		layer_sequence_destroy(plane_sequence);
		if(idle_mode = 0){
			draw_plane = 1;
		}
		if(idle_mode = 1){
			SetSequence(idle_sequence);
		}
		if(idle_mode = 2){
			SetSequence(idle_sequence,0);
		}
	}
	if(s = 1){
		if(sequence_exists(rampage_intro)){
			SetSequence(rampage_intro);
			draw_plane = 0;
		}
	}
	if(s = 2){
		if(sequence_exists(rampage)){
			SetSequence(rampage);
			draw_plane = 0;
		}
	}
	if(s = 3){
		if(rampage_outro_mode = 0){
			if(sequence_exists(rampage_outro)){
				SetSequence(rampage_outro);
			}
		}
		if(rampage_outro_mode = 1){
			if(sequence_exists(rampage_intro)){
				SetSequence(rampage_intro,1,1,seqdir_left);
			}
		}
	}
}