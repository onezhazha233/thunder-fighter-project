live;
image_xscale = scale_x
image_yscale = scale_y

if(instance_exists(track_inst)){
	target_angle = point_direction(x,y,track_inst.x,track_inst.y);
	direction += angle_difference(target_angle,direction)*rot_rate;
}
speed += 0.5
image_angle = direction - 90;

if(layer_sequence_is_finished(bullet_sequence)){
	layer_sequence_destroy(bullet_sequence);
	bullet_sequence = layer_sequence_create("bullets_player",x,y,idle);
}

rot_rate = min(rot_rate+0.005,0.3)

event_inherited();