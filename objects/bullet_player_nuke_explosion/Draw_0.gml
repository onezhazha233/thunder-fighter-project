live;
draw_text(x+30,y,dir)
if!(layer_sequence_is_finished(seq)){
	//layer_sequence_xscale(seq,image_xscale*(dir = 1 ? -1 : 1))
	draw_text(x+30,y+30,layer_sequence_get_xscale(seq));
}