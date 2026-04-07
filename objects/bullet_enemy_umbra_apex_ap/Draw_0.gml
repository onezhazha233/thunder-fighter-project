live;
if(layer_sequence_exists(global.layer_bullets_enemy,bullet_sequence)){
	layer_sequence_x(bullet_sequence,x);
	layer_sequence_y(bullet_sequence,y);
	layer_sequence_xscale(bullet_sequence,scale_x);
	layer_sequence_yscale(bullet_sequence,scale_y);
	layer_sequence_angle(bullet_sequence,image_angle);
}