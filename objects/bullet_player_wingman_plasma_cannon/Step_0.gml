live;
event_inherited()

if(layer_sequence_is_finished(bullet_sequence)){
	layer_sequence_destroy(bullet_sequence);
	instance_destroy();
}