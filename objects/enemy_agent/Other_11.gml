live;
SetState = function(s){
	state = s;
	if(display_mode = DISPLAY_MODE.SEQUENCE){
		if(s = ENEMY_STAT.PRE){
			if(pre_mode = PRE_MODE.START_FRAME){
				layer_sequence_destroy(enemy_sequence);
				enemy_sequence = layer_sequence_create(le,x,y,intro_sequence);
				layer_sequence_xscale(enemy_sequence,image_xscale);
				layer_sequence_yscale(enemy_sequence,image_yscale);
				layer_sequence_speedscale(enemy_sequence,0);
				layer_sequence_headpos(enemy_sequence,0);
			}
			if(pre_mode = PRE_MODE.SEQUENCE){
				layer_sequence_destroy(enemy_sequence);
				enemy_sequence = layer_sequence_create(le,x,y,pre_sequence);
				layer_sequence_xscale(enemy_sequence,image_xscale);
				layer_sequence_yscale(enemy_sequence,image_yscale);
			}
		}
		if(s = ENEMY_STAT.INTRO){
			layer_sequence_destroy(enemy_sequence);
			enemy_sequence = layer_sequence_create(le,x,y,intro_sequence);
			layer_sequence_xscale(enemy_sequence,image_xscale);
			layer_sequence_yscale(enemy_sequence,image_yscale);
		}
		if(s = ENEMY_STAT.IDLE){
			if(instance_exists(bullet_emitter_inst)){
				bullet_emitter_inst.enabled = true;
			}
			if(idle_mode = IDLE_MODE.END_FRAME){
				layer_sequence_destroy(enemy_sequence);
				enemy_sequence = layer_sequence_create(le,x,y,intro_sequence);
				layer_sequence_xscale(enemy_sequence,image_xscale);
				layer_sequence_yscale(enemy_sequence,image_yscale);
				layer_sequence_speedscale(enemy_sequence,0);
				layer_sequence_headpos(enemy_sequence,layer_sequence_get_length(enemy_sequence));
			}
			if(idle_mode = IDLE_MODE.SEQUENCE){
				layer_sequence_destroy(enemy_sequence);
				enemy_sequence = layer_sequence_create(le,x,y,idle_sequence);
				layer_sequence_xscale(enemy_sequence,image_xscale);
				layer_sequence_yscale(enemy_sequence,image_yscale);
			}
		}
		if(s = ENEMY_STAT.WITHDRAW){
			layer_sequence_destroy(enemy_sequence);
			enemy_sequence = layer_sequence_create(le,x,y,intro_sequence);
			layer_sequence_xscale(enemy_sequence,image_xscale);
			layer_sequence_yscale(enemy_sequence,image_yscale);
			layer_sequence_headdir(enemy_sequence,seqdir_left);
			layer_sequence_headpos(enemy_sequence,layer_sequence_get_length(enemy_sequence));
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
		draw_set_color(c_red)
		if(collision_type = 0){
			draw_rectangle(x-left*image_xscale,y-up*image_yscale,x+right*image_xscale,y+down*image_yscale,1);
		}
		if(collision_type = 1){
			draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
		}
		draw_set_color(-1)
		gpu_set_blendmode(bm_normal);
		if(surf_enabled = true&&surface_exists(surf))surface_reset_target();
	}
	layer_script_begin(le, scrBegin);
	layer_script_end(le, scrEnd);

	layer_script_begin(lel, scrBegin);
	layer_script_end(lel, scrEnd);

	layer_script_begin(leu, scrBegin);
	layer_script_end(leu, scrEnd);
	
	SetPosition(x,y);
}

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	if(instance_exists(bullet_emitter_inst)){
		bullet_emitter_inst.x = xx;
		bullet_emitter_inst.y = yy;
	}
	
	if(layer_sequence_exists(le,enemy_sequence)){
		layer_sequence_x(enemy_sequence,x-surf_x*surf_enabled);
		layer_sequence_y(enemy_sequence,y-surf_y*surf_enabled);
		layer_sequence_xscale(enemy_sequence,image_xscale);
		layer_sequence_yscale(enemy_sequence,image_yscale);
		layer_sequence_angle(enemy_sequence,image_angle);
	}
	if(layer_sequence_exists(lel,flame_lower_sequence)){
		layer_sequence_x(flame_lower_sequence,x+lengthdir_x(flame_lower_x_offset,image_angle)*image_xscale-surf_x*surf_enabled+lengthdir_x(flame_lower_y_offset,image_angle-90)*image_xscale);
		layer_sequence_y(flame_lower_sequence,y+lengthdir_y(flame_lower_x_offset,image_angle)*image_yscale-surf_y*surf_enabled+lengthdir_y(flame_lower_y_offset,image_angle-90)*image_yscale);
		layer_sequence_xscale(flame_lower_sequence,image_xscale);
		layer_sequence_yscale(flame_lower_sequence,image_yscale);
		layer_sequence_angle(flame_lower_sequence,image_angle);
	}
	if(layer_sequence_exists(leu,flame_upper_sequence)){
		layer_sequence_x(flame_upper_sequence,x+lengthdir_x(flame_upper_x_offset,image_angle)*image_xscale-surf_x*surf_enabled+lengthdir_x(flame_upper_y_offset,image_angle-90)*image_xscale);
		layer_sequence_y(flame_upper_sequence,y+lengthdir_y(flame_upper_x_offset,image_angle)*image_yscale-surf_y*surf_enabled+lengthdir_y(flame_upper_y_offset,image_angle-90)*image_yscale);
		layer_sequence_xscale(flame_upper_sequence,image_xscale);
		layer_sequence_yscale(flame_upper_sequence,image_yscale);
		layer_sequence_angle(flame_upper_sequence,image_angle);
	}
}