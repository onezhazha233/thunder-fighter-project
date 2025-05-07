if(keyboard_check_pressed(ord("Q"))){
	layer_sequence_play(s);
}
if(keyboard_check_pressed(ord("W"))){
	layer_sequence_pause(s);
}
if(keyboard_check_pressed(ord("E"))){
	if!(layer_sequence_get_sequence(s) = sequence_get(seq_phantom_d_rampage)){
		layer_sequence_destroy(s);
		s = layer_sequence_create("planes",x,y,seq_phantom_d_rampage_intro);
		layer_sequence_xscale(s,2);
		layer_sequence_yscale(s,2);
	}
	else{
		layer_sequence_destroy(s);
		s = layer_sequence_create("planes",x,y,seq_phantom_d_rampage_outro);
		layer_sequence_xscale(s,2);
		layer_sequence_yscale(s,2);
	}
}
if(keyboard_check_pressed(ord("R"))){
	game_restart();
}
if(layer_sequence_get_sequence(s) = sequence_get(seq_phantom_d_rampage_intro)&&layer_sequence_is_finished(s)){
	layer_sequence_destroy(s);
	s = layer_sequence_create("planes",x,y,seq_phantom_d_rampage);
	layer_sequence_xscale(s,2);
	layer_sequence_yscale(s,2);
}
if(layer_sequence_get_sequence(s) = sequence_get(seq_phantom_d_rampage_outro)&&layer_sequence_is_finished(s)){
	layer_sequence_destroy(s);
	s = layer_sequence_create("planes",x,y,seq_phantom_d_rampage_intro);
	layer_sequence_xscale(s,2);
	layer_sequence_yscale(s,2);
	layer_sequence_speedscale(s,0);
}