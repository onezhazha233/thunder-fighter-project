SetState = function(s){
	state = s;
	if(s = 0){
		layer_sequence_destroy(plane_sequence);
		if(idle_mode = 0){
			draw_plane = 1;
		}
		if(idle_mode = 1){
			SetSequence(idle_sequence);
		}
		if(idle_mode = 2){
			SetSequence(idle_sequence,0);
		}
	}
	if(s = 1){
		if(sequence_exists(rampage_intro)){
			SetSequence(rampage_intro);
			draw_plane = 0;
		}
	}
	if(s = 2){
		if(sequence_exists(rampage)){
			SetSequence(rampage);
			draw_plane = 0;
		}
	}
	if(s = 3){
		if(rampage_outro_mode = 0){
			if(sequence_exists(rampage_outro)){
				SetSequence(rampage_outro);
			}
		}
		if(rampage_outro_mode = 1){
			if(sequence_exists(rampage_intro)){
				SetSequence(rampage_intro,1,1,seqdir_left);
			}
		}
	}
}
SetSurfEnabled = function(enabled){
	surf_enabled = enabled;
	var scrBegin = function(){
		if (event_number != ev_draw_normal) return;
		if(surf_enabled = true&&surface_exists(surf))surface_set_target(surf);
		gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
		shader_set(shd_blend_alpha);
		shader_set_uniform_f(shader_get_uniform(shd_blend_alpha,"u_blendColor"),color_get_red(image_blend)/255,color_get_green(image_blend)/255,color_get_blue(image_blend)/255,image_alpha);
	}

	var scrEnd = function(){
		if (event_number != ev_draw_normal) return;
		shader_reset();
		gpu_set_blendmode(bm_normal);
		if(surf_enabled = true&&surface_exists(surf))surface_reset_target();
	}
	layer_script_begin(layer_plane, scrBegin);
	layer_script_end(layer_plane, scrEnd);

	layer_script_begin(layer_plane_lower, scrBegin);
	layer_script_end(layer_plane_lower, scrEnd);
	
	layer_script_begin(layer_plane_upper, scrBegin);
	layer_script_end(layer_plane_upper, scrEnd);
	
	SetPosition(x,y);
}

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
					xscale = image_xscale*sign(roll_state);
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

SetSequence = function(seq,spd=1,pos=0,dir=seqdir_right){
	layer_sequence_destroy(plane_sequence);
	plane_sequence = layer_sequence_create(layer_plane,x,y,seq);
	layer_sequence_xscale(plane_sequence,image_xscale);
	layer_sequence_yscale(plane_sequence,image_yscale);
	layer_sequence_speedscale(plane_sequence,spd);
	if(pos = 0)p = 0;
	if(pos = 1)p = layer_sequence_get_length(plane_sequence);
	layer_sequence_headpos(plane_sequence,p);
	layer_sequence_headdir(plane_sequence,dir);
}