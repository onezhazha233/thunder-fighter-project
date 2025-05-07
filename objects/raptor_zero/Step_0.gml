if(keyboard_check_pressed(ord("Q"))){
	layer_sequence_play(s);
}
if(keyboard_check_pressed(ord("W"))){
	layer_sequence_pause(s);
}
if(keyboard_check_pressed(ord("E"))){
	if!(layer_sequence_get_sequence(s) = sequence_get(seq_raptor_a_rampage)){
		s = layer_sequence_create("planes",x,y,seq_raptor_a_rampage_intro);
		layer_sequence_xscale(s,3);
		layer_sequence_yscale(s,3);
		draw = 0;
	}
	else{
		layer_sequence_destroy(s);
		s = layer_sequence_create("planes",x,y,seq_raptor_a_rampage_outro);
		layer_sequence_xscale(s,3);
		layer_sequence_yscale(s,3);
	}
}
if(keyboard_check_pressed(ord("R"))){
	game_restart();
}
if(layer_sequence_get_sequence(s) = sequence_get(seq_raptor_a_rampage_intro)&&layer_sequence_is_finished(s)){
	layer_sequence_destroy(s);
	s = layer_sequence_create("planes",x,y,seq_raptor_a_rampage);
	layer_sequence_xscale(s,3);
	layer_sequence_yscale(s,3);
}
if(layer_sequence_get_sequence(s) = sequence_get(seq_raptor_a_rampage_outro)&&layer_sequence_is_finished(s)){
	layer_sequence_destroy(s);
	draw = 1;
}