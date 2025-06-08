SetState = function(s){
	state = s;
	if(s = 0){
		layer_sequence_destroy(plane_sequence);
		if(idle_mode = 0){
			draw_plane = 1;
		}
		if(idle_mode = 1){
			plane_sequence = layer_sequence_create("planes",x,y,idle_sequence);
			layer_sequence_xscale(plane_sequence,image_xscale);
			layer_sequence_yscale(plane_sequence,image_yscale);
		}
		if(idle_mode = 2){
			plane_sequence = layer_sequence_create("planes",x,y,idle_sequence);
			layer_sequence_xscale(plane_sequence,image_xscale);
			layer_sequence_yscale(plane_sequence,image_yscale);
			layer_sequence_headpos(plane_sequence,0);
			layer_sequence_speedscale(plane_sequence,0);
		}
	}
	if(s = 1){
		if(sequence_exists(rampage_intro)){
			layer_sequence_destroy(plane_sequence);
			plane_sequence = layer_sequence_create("planes",x,y,rampage_intro);
			layer_sequence_xscale(plane_sequence,image_xscale);
			layer_sequence_yscale(plane_sequence,image_yscale);
			draw_plane = 0;
		}
	}
	if(s = 2){
		if(sequence_exists(rampage)){
			layer_sequence_destroy(plane_sequence);
			plane_sequence = layer_sequence_create("planes",x,y,rampage);
			layer_sequence_xscale(plane_sequence,image_xscale);
			layer_sequence_yscale(plane_sequence,image_yscale);
			draw_plane = 0;
		}
	}
	if(s = 3){
		layer_sequence_destroy(plane_sequence);
		if(rampage_outro_mode = 0){
			if(sequence_exists(rampage_outro)){
				plane_sequence = layer_sequence_create("planes",x,y,rampage_outro);
				layer_sequence_xscale(plane_sequence,image_xscale);
				layer_sequence_yscale(plane_sequence,image_yscale);
			}
		}
		if(rampage_outro_mode = 1){
			if(sequence_exists(rampage_intro)){
				plane_sequence = layer_sequence_create("planes",x,y,rampage_intro);
				layer_sequence_xscale(plane_sequence,image_xscale);
				layer_sequence_yscale(plane_sequence,image_yscale);
				layer_sequence_headdir(plane_sequence,seqdir_left);
				layer_sequence_headpos(plane_sequence,layer_sequence_get_length(plane_sequence));
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
	layer_script_begin("planes", scrBegin);
	layer_script_end("planes", scrEnd);

	layer_script_begin("planes_lower", scrBegin);
	layer_script_end("planes_lower", scrEnd);
	
	layer_script_begin("planes_upper", scrBegin);
	layer_script_end("planes_upper", scrEnd);
	
	SetPosition(x,y);
}

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	if(instance_exists(bullet_emitter_inst)){
		bullet_emitter_inst.x = xx;
		bullet_emitter_inst.y = yy;

		with(bullet_emitter_inst){
			for(i=0;i<array_length(follow_inst);i+=1){
				if(instance_exists(follow_inst[i])){
					follow_inst[i].x = xx;
					follow_inst[i].y = yy;
				}
				else{
					array_delete(follow_inst,i,0);
				}
			}
			for(i=0;i<array_length(follow_seq);i+=1){
				if(layer_sequence_exists(follow_seq[i,0],follow_seq[i,1])){
					layer_sequence_x(follow_seq[i,1],follow_seq[i,2][0]);
					layer_sequence_y(follow_seq[i,1],follow_seq[i,2][1]);
				}
				else{
					array_delete(follow_seq,i,0);
				}
			}
		}
	}
	
	if(layer_sequence_exists("planes",plane_sequence)){
		layer_sequence_x(plane_sequence,x-surf_x*surf_enabled);
		layer_sequence_y(plane_sequence,y-surf_y*surf_enabled);
		layer_sequence_xscale(plane_sequence,(state == 0&&roll_state != 0 ? 0 : image_xscale));
		layer_sequence_yscale(plane_sequence,image_yscale);
		layer_sequence_angle(plane_sequence,image_angle);
	}
	if(layer_sequence_exists("planes_lower",flame_lower_sequence)){
		layer_sequence_x(flame_lower_sequence,x+lengthdir_x(flame_lower_x_offset,image_angle)*image_xscale-surf_x*surf_enabled+lengthdir_x(flame_lower_y_offset,image_angle-90)*image_xscale);
		layer_sequence_y(flame_lower_sequence,y+lengthdir_y(flame_lower_x_offset,image_angle)*image_yscale-surf_y*surf_enabled+lengthdir_y(flame_lower_y_offset,image_angle-90)*image_yscale);
		layer_sequence_xscale(flame_lower_sequence,image_xscale);
		layer_sequence_yscale(flame_lower_sequence,image_yscale);
		layer_sequence_angle(flame_lower_sequence,image_angle);
	}
	if(layer_sequence_exists("planes_upper",flame_upper_sequence)){
		layer_sequence_x(flame_upper_sequence,x+lengthdir_x(flame_upper_x_offset,image_angle)*image_xscale-surf_x*surf_enabled+lengthdir_x(flame_upper_y_offset,image_angle-90)*image_xscale);
		layer_sequence_y(flame_upper_sequence,y+lengthdir_y(flame_upper_x_offset,image_angle)*image_yscale-surf_y*surf_enabled+lengthdir_y(flame_upper_y_offset,image_angle-90)*image_yscale);
		layer_sequence_xscale(flame_upper_sequence,image_xscale);
		layer_sequence_yscale(flame_upper_sequence,image_yscale);
		layer_sequence_angle(flame_upper_sequence,image_angle);
	}
}