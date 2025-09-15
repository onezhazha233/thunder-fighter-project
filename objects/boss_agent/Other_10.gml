live;
SetState = function(s){
	state = s;
	if(s = 0){
		SetFlame(flame_lower_pre,flame_upper_pre);
		if(pre_mode = 0){
			layer_sequence_destroy(enemy_sequence);
			enemy_sequence = layer_sequence_create(layer_enemy,x,y,intro_sequence);
			layer_sequence_xscale(enemy_sequence,image_xscale);
			layer_sequence_yscale(enemy_sequence,image_yscale);
			layer_sequence_speedscale(enemy_sequence,0);
			layer_sequence_headpos(enemy_sequence,0);
		}
		if(pre_mode = 1){
			layer_sequence_destroy(enemy_sequence);
			enemy_sequence = layer_sequence_create(layer_enemy,x,y,pre_sequence);
			layer_sequence_xscale(enemy_sequence,image_xscale);
			layer_sequence_yscale(enemy_sequence,image_yscale);
		}
	}
	if(s = 1){
		layer_sequence_destroy(flame_lower_sequence);
		layer_sequence_destroy(flame_upper_sequence);
		layer_sequence_destroy(enemy_sequence);
		enemy_sequence = layer_sequence_create(layer_enemy,x,y,intro_sequence);
		layer_sequence_xscale(enemy_sequence,image_xscale);
		layer_sequence_yscale(enemy_sequence,image_yscale);
	}
	if(s = 2){
		start = 1;
		if(instance_exists(bullet_emitter_inst)){
			bullet_emitter_inst.enabled = true;
		}
		global.inv_cutscene = 0;
		player.equipment.SetEnabled(true);
		inv_collision = false;
		SetFlame(flame_lower,flame_upper);
		if(idle_mode = 0){
			layer_sequence_destroy(enemy_sequence);
			enemy_sequence = layer_sequence_create(layer_enemy,x,y,intro_sequence);
			layer_sequence_xscale(enemy_sequence,image_xscale);
			layer_sequence_yscale(enemy_sequence,image_yscale);
			layer_sequence_speedscale(enemy_sequence,0);
			layer_sequence_headpos(enemy_sequence,layer_sequence_get_length(enemy_sequence));
		}
		if(idle_mode = 1){
			layer_sequence_destroy(enemy_sequence);
			enemy_sequence = layer_sequence_create(layer_enemy,x,y,idle_sequence);
			layer_sequence_xscale(enemy_sequence,image_xscale);
			layer_sequence_yscale(enemy_sequence,image_yscale);
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
		
		gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
	    draw_surface_ext(surf_effect, 0, 0, 1, 1, 0, c_white, 1);
		
		if(surf_enabled = true&&surface_exists(surf))surface_reset_target();
		shader_reset();
		if(global.debug_enemy_collision_display = true){
			draw_set_color(c_red);
			if(collision_type = 0){
				draw_rectangle(x-left*image_xscale,y-up*image_yscale,x+right*image_xscale,y+down*image_yscale,1);
			}
			if(collision_type = 1){
				draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
			}
			draw_set_color(-1);
		}
		gpu_set_blendmode(bm_normal);
	}
	layer_script_begin(layer_enemy, scrBegin);
	layer_script_end(layer_enemy, scrEnd);

	layer_script_begin(layer_enemy_lower, scrBegin);
	layer_script_end(layer_enemy_lower, scrEnd);

	layer_script_begin(layer_enemy_upper, scrBegin);
	layer_script_end(layer_enemy_upper, scrEnd);
	
	SetPosition(x,y);
}

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	if(instance_exists(bullet_emitter_inst)){
		bullet_emitter_inst.x = xx;
		bullet_emitter_inst.y = yy;
	}
	
	if(layer_sequence_exists(layer_enemy,enemy_sequence)){
		layer_sequence_x(enemy_sequence,x-surf_x*surf_enabled);
		layer_sequence_y(enemy_sequence,y-surf_y*surf_enabled);
		layer_sequence_xscale(enemy_sequence,image_xscale);
		layer_sequence_yscale(enemy_sequence,image_yscale);
		layer_sequence_angle(enemy_sequence,image_angle);
	}
	if(layer_sequence_exists(layer_enemy_lower,flame_lower_sequence)){
		layer_sequence_x(flame_lower_sequence,x+lengthdir_x(flame_lower_x_offset,image_angle)*image_xscale-surf_x*surf_enabled+lengthdir_x(flame_lower_y_offset,image_angle-90)*image_xscale);
		layer_sequence_y(flame_lower_sequence,y+lengthdir_y(flame_lower_x_offset,image_angle)*image_yscale-surf_y*surf_enabled+lengthdir_y(flame_lower_y_offset,image_angle-90)*image_yscale);
		layer_sequence_xscale(flame_lower_sequence,image_xscale);
		layer_sequence_yscale(flame_lower_sequence,image_yscale);
		layer_sequence_angle(flame_lower_sequence,image_angle);
	}
	if(layer_sequence_exists(layer_enemy_upper,flame_upper_sequence)){
		layer_sequence_x(flame_upper_sequence,x+lengthdir_x(flame_upper_x_offset,image_angle)*image_xscale-surf_x*surf_enabled+lengthdir_x(flame_upper_y_offset,image_angle-90)*image_xscale);
		layer_sequence_y(flame_upper_sequence,y+lengthdir_y(flame_upper_x_offset,image_angle)*image_yscale-surf_y*surf_enabled+lengthdir_y(flame_upper_y_offset,image_angle-90)*image_yscale);
		layer_sequence_xscale(flame_upper_sequence,image_xscale);
		layer_sequence_yscale(flame_upper_sequence,image_yscale);
		layer_sequence_angle(flame_upper_sequence,image_angle);
	}
}

SetFlame = function(lower,upper){
	layer_sequence_destroy(flame_lower_sequence);
	layer_sequence_destroy(flame_upper_sequence);
	if(sequence_exists(lower)){
		flame_lower_sequence = layer_sequence_create(layer_enemy_lower,x+lengthdir_x(flame_lower_x_offset-surf_x*surf_enabled,image_angle),y+lengthdir_y(flame_lower_y_offset-surf_y*surf_enabled,image_angle),lower);
		layer_sequence_xscale(flame_lower_sequence,image_xscale);
		layer_sequence_yscale(flame_lower_sequence,image_yscale);
		layer_sequence_angle(flame_lower_sequence,image_angle);
	}
	if(sequence_exists(upper)){
		flame_upper_sequence = layer_sequence_create(leu,x+lengthdir_x(flame_upper_x_offset-surf_x*surf_enabled,image_angle),y+lengthdir_y(flame_upper_y_offset-surf_y*surf_enabled,image_angle),upper);
		layer_sequence_xscale(flame_upper_sequence,image_xscale);
		layer_sequence_yscale(flame_upper_sequence,image_yscale);
		layer_sequence_angle(flame_upper_sequence,image_angle);
	}
}

CreateItem = function(){
	var total_weight = 0;
    for (var i = 0; i < array_length(items); i++) {
        total_weight += items[i][1];
    }
    
    var rand = random(total_weight);
    var current_weight = 0;
    
    for (var i = 0; i < array_length(items); i++) {
        current_weight += items[i][1];
        if (rand < current_weight) {
            var selected_items = items[i][0];
            for (var j = 0; j < array_length(selected_items); j++) {
                item_inst[j] = instance_create_depth(x,y,0,selected_items[j]);
            }
            break;
        }
    }
	return item_inst;
}

Hurt = function(){
	hurt_time = 120;
	if!(Anim_IsExists(id,"blend_g")){
		Anim_Create(id,"blend_g",0,0,0,255,4);
		Anim_Create(id,"blend_b",0,0,0,255,4);
	}
}

SetMoveEnabled = function(enabled){
	move_enabled = enabled;
	if(move_enabled = true){
		move_nexttime = time;
		move_state = 0;
	}
	else{
		Anim_Destroy(id,"x");
		Anim_Destroy(id,"y");
	}
}

SetSequence = function(seq){
	layer_sequence_destroy(enemy_sequence);
	enemy_sequence = layer_sequence_create(layer_enemy,x,y,seq);
	layer_sequence_xscale(enemy_sequence,image_xscale);
	layer_sequence_yscale(enemy_sequence,image_yscale);
}