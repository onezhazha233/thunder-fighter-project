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
	bullet_emitter_inst.rampage_mode = rampage_mode;

	state = s;
	if(s = 0){
		layer_sequence_destroy(plane_sequence);
		if(idle_mode = EQUIPMENT_IDLE_MODE.SPRITE){
			draw_plane = 1;
		}
		if(idle_mode = EQUIPMENT_IDLE_MODE.SEQUENCE){
			SetSequence(idle_sequence);
		}
		if(idle_mode = EQUIPMENT_IDLE_MODE.FIRST_FRAME){
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
		rampage_mode = choose(0,1);
		if(rampage_outro_mode = EQUIPMENT_RAMPAGE_OUTRO_MODE.SEQUENCE){
			if(sequence_exists(rampage_outro)){
				SetSequence(rampage_outro);
			}
		}
		if(rampage_outro_mode = EQUIPMENT_RAMPAGE_OUTRO_MODE.REVERSE_INTRO){
			if(sequence_exists(rampage_intro)){
				SetSequence(rampage_intro,1,1,seqdir_left);
			}
		}
	}
}