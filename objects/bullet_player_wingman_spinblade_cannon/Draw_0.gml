live;
image_xscale = scale_x*(dir = 1 ? -1 : 1)
image_yscale = scale_y

if(mode = 0){
	if(layer_sequence_is_finished(bullet_sequence)){
		layer_sequence_destroy(bullet_sequence);
		bullet_sequence = layer_sequence_create(ll,x,y,idle);
		layer_sequence_xscale(bullet_sequence,scale_x*(dir = 1 ? -1 : 1));
		mode = 1;
	}
}
if(mode = 2){
	if(layer_sequence_is_finished(bullet_sequence)){
		layer_sequence_destroy(bullet_sequence);
		bullet_sequence = layer_sequence_create(ll,x,y,edge);
		layer_sequence_xscale(bullet_sequence,scale_x*(dir = 1 ? -1 : 1));
		mode = 3;
	}
}

if(layer_sequence_exists(ll,bullet_sequence)){
	layer_sequence_x(bullet_sequence,x);
	layer_sequence_y(bullet_sequence,y);
	layer_sequence_xscale(bullet_sequence,scale_x*(dir = 1 ? -1 : 1));
	layer_sequence_yscale(bullet_sequence,scale_y);
	layer_sequence_angle(bullet_sequence,image_angle);
	layer_sequence_speedscale(bullet_sequence,game_get_speed(gamespeed_fps)/60*animspd);
}

/*if(mode >= 2){
	if(duration > 0){
		draw_set_alpha(0.5);
		draw_circle_color(x,y,150*scale_x,c_lime,c_lime,0);
		draw_set_alpha(2);
	}
}