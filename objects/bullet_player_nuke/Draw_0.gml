live;
if(layer_sequence_is_finished(bullet_sequence)){
	layer_sequence_destroy(bullet_sequence);
	bullet_sequence = layer_sequence_create("bullets_player",x,y,idle);
}

event_inherited();