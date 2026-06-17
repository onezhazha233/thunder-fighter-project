live;
if(enabled = true){
	if(layer_sequence_is_finished(bullet_sequence)||!layer_sequence_exists(ll,bullet_sequence)){
		layer_destroy(ll);
		layer_sequence_destroy(bullet_sequence);
		instance_destroy();
	}
}