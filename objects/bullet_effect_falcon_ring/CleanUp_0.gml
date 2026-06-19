live;
if(ll != -1 && layer_exists(ll)){
	layer_destroy(ll);
}
if(seq != -1){
	layer_sequence_destroy(seq);
}