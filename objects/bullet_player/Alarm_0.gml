if(sequence_exists(sequence)){
	bullet_sequence = layer_sequence_create("bullets_player",x,y,sequence);
	layer_sequence_xscale(bullet_sequence,image_xscale);
	layer_sequence_yscale(bullet_sequence,image_yscale);
}