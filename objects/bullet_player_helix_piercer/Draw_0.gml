live;
image_xscale = xscale*scale_x
image_yscale = yscale*scale_y

event_inherited();

if(layer_sequence_exists(global.layer_bullets_player,bullet_sequence)){
	layer_sequence_x(bullet_sequence,x);
	layer_sequence_y(bullet_sequence,y);
	layer_sequence_xscale(bullet_sequence,image_xscale);
	layer_sequence_yscale(bullet_sequence,image_yscale);
	layer_sequence_angle(bullet_sequence,image_angle-90);
	layer_sequence_blend(bullet_sequence,image_blend);
	layer_sequence_alpha(bullet_sequence,image_alpha);
}