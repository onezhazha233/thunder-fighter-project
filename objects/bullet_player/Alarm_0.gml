if(sequence_exists(sequence)){
	sequence = layer_sequence_create("bullets_player",x,y,bullet_sequence);
	layer_sequence_xscale(sequence,image_xscale);
	layer_sequence_yscale(sequence,image_yscale);
}