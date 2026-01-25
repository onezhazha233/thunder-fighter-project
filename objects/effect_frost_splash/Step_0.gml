live;
Sequence_PlayByFrame(ll)
if(layer_sequence_is_finished(seq)){
	layer_sequence_destroy(seq);
	instance_destroy();
}
if(layer_sequence_get_headpos(seq) >= 16&&instance_exists(block)){
	instance_destroy(block);
}