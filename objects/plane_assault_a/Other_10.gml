live;
event_inherited();

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	if(instance_exists(bullet_emitter_inst)){
		bullet_emitter_inst.SetPosition(x,y);
	}
	
	if(layer_sequence_exists(layer_plane,plane_sequence)){
		layer_sequence_x(plane_sequence,x-surf_x*surf_enabled);
		layer_sequence_y(plane_sequence,y-surf_y*surf_enabled);
		xscale = image_xscale;
		if(state = 0){
			if!(roll_state = 0){
				if(roll_mode = 0){
					xscale = 0;
				}
				else{
					if(roll_sequence_flip = true){
						xscale = image_xscale*sign(roll_state);
					}
					else{
						xscale = image_xscale;
					}
				}
			}
		}
		layer_sequence_xscale(plane_sequence,xscale);
		layer_sequence_yscale(plane_sequence,image_yscale);
		layer_sequence_angle(plane_sequence,image_angle);
	}
	if(layer_sequence_exists(layer_plane_lower,flame_lower_sequence)){
		layer_sequence_x(flame_lower_sequence,x+lengthdir_x(flame_lower_x_offset,image_angle)*image_xscale-surf_x*surf_enabled+lengthdir_x(flame_lower_y_offset,image_angle-90)*image_xscale);
		layer_sequence_y(flame_lower_sequence,y+lengthdir_y(flame_lower_x_offset,image_angle)*image_yscale-surf_y*surf_enabled+lengthdir_y(flame_lower_y_offset,image_angle-90)*image_yscale);
		layer_sequence_xscale(flame_lower_sequence,image_xscale);
		layer_sequence_yscale(flame_lower_sequence,image_yscale);
		layer_sequence_angle(flame_lower_sequence,image_angle);
	}
	if(layer_sequence_exists(layer_plane_upper,flame_upper_sequence)){
		layer_sequence_x(flame_upper_sequence,x+lengthdir_x(flame_upper_x_offset,image_angle)*image_xscale-surf_x*surf_enabled+lengthdir_x(flame_upper_y_offset,image_angle-90)*image_xscale);
		layer_sequence_y(flame_upper_sequence,y+lengthdir_y(flame_upper_x_offset,image_angle)*image_yscale-surf_y*surf_enabled+lengthdir_y(flame_upper_y_offset,image_angle-90)*image_yscale);
		layer_sequence_xscale(flame_upper_sequence,image_xscale);
		layer_sequence_yscale(flame_upper_sequence,image_yscale);
		layer_sequence_angle(flame_upper_sequence,image_angle);
	}
}