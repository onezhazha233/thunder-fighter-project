live;
if(layer_sequence_exists("bullets_player",bullet_sequence)){
	layer_sequence_x(bullet_sequence,x);
	layer_sequence_y(bullet_sequence,y);
	layer_sequence_xscale(bullet_sequence,image_xscale);
	layer_sequence_yscale(bullet_sequence,image_yscale);
	layer_sequence_angle(bullet_sequence,image_angle);
}