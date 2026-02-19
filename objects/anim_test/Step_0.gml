live;
if(layer_sequence_is_finished(seq)){
	var _old = seq;
	seq_index += 1;
	layer_sequence_destroy(_old);
	if(seq_index < array_length(seq_instances)){
		seq = seq_instances[seq_index];
		layer_sequence_xscale(seq,1);
		layer_sequence_play(seq);
	}
}