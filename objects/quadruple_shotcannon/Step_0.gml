if(keyboard_check_pressed(ord("Q"))){
	layer_sequence_play(sl);
	layer_sequence_play(sr);
}
if(keyboard_check_pressed(ord("W"))){
	layer_sequence_pause(sl);
	layer_sequence_pause(sr);
}
if(keyboard_check_pressed(ord("E"))){
	if!(layer_sequence_get_sequence(sr) = sequence_get(seq_shotcannon_c_rampage)){
		sl = layer_sequence_create("planes",x-ox,y+oy,seq_shotcannon_c_rampage_intro);
		layer_sequence_xscale(sl,-3);
		layer_sequence_yscale(sl,3);
		sr = layer_sequence_create("planes",x+ox,y+oy,seq_shotcannon_c_rampage_intro);
		layer_sequence_xscale(sr,3);
		layer_sequence_yscale(sr,3);
		draw = 0;
	}
	else{
		layer_sequence_destroy(sl);
		layer_sequence_destroy(sr);
		sl = layer_sequence_create("planes",x-ox,y+oy,seq_shotcannon_c_rampage_intro);
		layer_sequence_xscale(sl,-3);
		layer_sequence_yscale(sl,3);
		sr = layer_sequence_create("planes",x+ox,y+oy,seq_shotcannon_c_rampage_intro);
		layer_sequence_xscale(sr,3);
		layer_sequence_yscale(sr,3);
		layer_sequence_headdir(sl,seqdir_left);
		layer_sequence_headpos(sl,layer_sequence_get_length(sl));
		layer_sequence_headdir(sr,seqdir_left);
		layer_sequence_headpos(sr,layer_sequence_get_length(sr));
	}
}
if(keyboard_check_pressed(ord("R"))){
	game_restart();
}
if(layer_sequence_get_sequence(sr) = sequence_get(seq_shotcannon_c_rampage_intro)&&layer_sequence_is_finished(sr)){
	if(layer_sequence_get_headdir(sr) = seqdir_right){
		layer_sequence_destroy(sl);
		layer_sequence_destroy(sr);
		sl = layer_sequence_create("planes",x-ox,y+oy,seq_shotcannon_c_rampage);
		layer_sequence_xscale(sl,-3);
		layer_sequence_yscale(sl,3);
		sr = layer_sequence_create("planes",x+ox,y+oy,seq_shotcannon_c_rampage);
		layer_sequence_xscale(sr,3);
		layer_sequence_yscale(sr,3);
	}
	else{
		layer_sequence_destroy(sl);
		layer_sequence_destroy(sr);
		draw = 1;
	}
}