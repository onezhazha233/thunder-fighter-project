if(layer_sequence_is_finished(subweapon_sequence)){
	//layer_sequence_destroy(subweapon_sequence);
	if(rampage = 0){
		//subweapon_sequence = layer_sequence_create("bullets_player",x,y,seq_missile_ab_idle);
	}
	else{
		//subweapon_sequence = layer_sequence_create("bullets_player",x,y,seq_missile_ab_rampage);
	}
	//layer_sequence_xscale(subweapon_sequence,image_xscale);
	//layer_sequence_yscale(subweapon_sequence,image_yscale);
	//layer_sequence_angle(subweapon_sequence,image_angle);
}

if(sequence_exists(subweapon_sequence)){
	layer_sequence_x(subweapon_sequence,x);
	layer_sequence_y(subweapon_sequence,y);
	layer_sequence_xscale(subweapon_sequence,image_xscale);
	layer_sequence_yscale(subweapon_sequence,image_yscale);
	layer_sequence_angle(subweapon_sequence,image_angle);
}

if!(point_distance(x,y,mouse_x,mouse_y) < 10){
	speed = 10;
	image_angle = point_direction(x,y,mouse_x,mouse_y) - 90;
	direction = image_angle + 90;
}
else{
	x = mouse_x;
	y = mouse_y;
	speed = 0;
}