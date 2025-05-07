SetState = function(s){
	state = s;
	if(s = 0){
		layer_sequence_destroy(wingman_sequence);
		if(idle_mode = 0){
			draw_wingman = 1;
		}
		if(idle_mode = 1){
			wingman_sequence = layer_sequence_create("wingmans",x,y,idle_sequence);
			layer_sequence_xscale(wingman_sequence,image_xscale*(flip=1 ? -1 : 1));
			layer_sequence_yscale(wingman_sequence,image_yscale);
		}
		if(idle_mode = 2){
			wingman_sequence = layer_sequence_create("wingmans",x,y,rampage_intro);
			layer_sequence_xscale(wingman_sequence,image_xscale*(flip=1 ? -1 : 1));
			layer_sequence_yscale(wingman_sequence,image_yscale);
			layer_sequence_speedscale(wingman_sequence,0);
			layer_sequence_headpos(wingman_sequence,0);
		}
	}
	if(s = 1){
		layer_sequence_destroy(wingman_sequence);
		wingman_sequence = layer_sequence_create("wingmans",x,y,rampage_intro);
		layer_sequence_xscale(wingman_sequence,image_xscale*(flip=1 ? -1 : 1));
		layer_sequence_yscale(wingman_sequence,image_yscale);
		draw_wingman = 0;
	}
	if(s = 2){
		layer_sequence_destroy(wingman_sequence);
		wingman_sequence = layer_sequence_create("wingmans",x,y,rampage);
		layer_sequence_xscale(wingman_sequence,image_xscale*(flip=1 ? -1 : 1));
		layer_sequence_yscale(wingman_sequence,image_yscale);
		draw_wingman = 0;
	}
	if(s = 3){
		layer_sequence_destroy(wingman_sequence);
		if(rampage_outro_mode = 0){
			wingman_sequence = layer_sequence_create("wingmans",x,y,rampage_outro);
			layer_sequence_xscale(wingman_sequence,image_xscale*(flip=1 ? -1 : 1));
			layer_sequence_yscale(wingman_sequence,image_yscale);
		}
		if(rampage_outro_mode = 1){
			wingman_sequence = layer_sequence_create("wingmans",x,y,rampage_intro);
			layer_sequence_xscale(wingman_sequence,image_xscale*(flip=1 ? -1 : 1));
			layer_sequence_yscale(wingman_sequence,image_yscale);
			layer_sequence_headdir(wingman_sequence,seqdir_left);
			layer_sequence_headpos(wingman_sequence,layer_sequence_get_length(wingman_sequence));
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
	layer_script_begin("wingmans", scrBegin);
	layer_script_end("wingmans", scrEnd);

	layer_script_begin("wingmans_lower", scrBegin);
	layer_script_end("wingmans_lower", scrEnd);
	
	SetPosition(x,y);
}

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	if(instance_exists(bullet_emitter_inst)){
		bullet_emitter_inst.x = xx;
		bullet_emitter_inst.y = yy;

		with(bullet_emitter_inst){
			if(instance_exists(fire)){
				fire.x = xx;
				fire.y = yy;
			}
		}
	}
	
	if(layer_sequence_exists("wingmans",wingman_sequence)){
		layer_sequence_x(wingman_sequence,x-surf_x*surf_enabled);
		layer_sequence_y(wingman_sequence,y-surf_y*surf_enabled);
		layer_sequence_xscale(wingman_sequence,image_xscale*(flip=1 ? -1 : 1));
		layer_sequence_yscale(wingman_sequence,image_yscale);
		layer_sequence_angle(wingman_sequence,image_angle);
	}
	if(layer_sequence_exists("wingmans_lower",flame_sequence)){
		layer_sequence_x(flame_sequence,x+lengthdir_x(flame_x_offset,image_angle)*image_xscale-surf_x*surf_enabled+lengthdir_x(flame_y_offset,image_angle-90)*image_xscale-surf_x*surf_enabled);
		layer_sequence_y(flame_sequence,y+lengthdir_y(flame_x_offset,image_angle)*image_yscale-surf_y*surf_enabled+lengthdir_y(flame_y_offset,image_angle-90)*image_yscale-surf_y*surf_enabled);
		layer_sequence_xscale(flame_sequence,image_xscale*(flip=1 ? -1 : 1));
		layer_sequence_yscale(flame_sequence,image_yscale);
		layer_sequence_angle(flame_sequence,image_angle);
	}
}