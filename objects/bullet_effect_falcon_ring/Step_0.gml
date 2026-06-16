live;
if(enabled = true){
	if(layer_sequence_is_finished(seq)||!layer_sequence_exists(ll,seq)){
		layer_destroy(ll);
		layer_sequence_destroy(seq);
		instance_destroy();
	}
}