live;
SetState = function(s){
	state = s;
	if(display_mode = DISPLAY_MODE.SEQUENCE){
		if(s = ENEMY_STATE.PRE){
			if(pre_mode = PRE_MODE.START_FRAME){
				SetSequence(intro_sequence,0);
			}
			if(pre_mode = PRE_MODE.SEQUENCE){
				SetSequence(pre_sequence);
			}
		}
		if(s = ENEMY_STATE.INTRO){
			SetSequence(intro_sequence);
		}
		if(s = ENEMY_STATE.IDLE){
			if(instance_exists(bullet_emitter_inst)){
				bullet_emitter_inst.enabled = true;
			}
			if(idle_mode = IDLE_MODE.END_FRAME){
				SetSequence(intro_sequence,0,1);
			}
			if(idle_mode = IDLE_MODE.SEQUENCE){
				SetSequence(idle_sequence);
			}
		}
		if(s = ENEMY_STATE.WITHDRAW){
			SetSequence(intro_sequence,1,1,seqdir_left);
		}
	}
	else{
		if(s = ENEMY_STATE.INTRO){
			SetState(ENEMY_STATE.IDLE);
		}
		if(s = ENEMY_STATE.IDLE){
			if(instance_exists(bullet_emitter_inst)){
				bullet_emitter_inst.enabled = true;
			}
		}
		if(s = ENEMY_STATE.WITHDRAW){
			SetState(ENEMY_STATE.PRE);
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
		gpu_set_blendmode(bm_normal);
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
		flame_upper_sequence = layer_sequence_create(layer_enemy_upper,x+lengthdir_x(flame_upper_x_offset-surf_x*surf_enabled,image_angle),y+lengthdir_y(flame_upper_y_offset-surf_y*surf_enabled,image_angle),upper);
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
                instance_create_depth(x,y,0,selected_items[j]);
            }
            break;
        }
    }
}

Hurt = function(){
	hurt_time = 120;
	if!(Anim_IsExists(id,"blend_g")){
		Anim_Create(id,"blend_g",0,0,0,255,4);
		Anim_Create(id,"blend_b",0,0,0,255,4);
	}
}

SetSequence = function(seq,spd=1,pos=0,dir=seqdir_right){
	layer_sequence_destroy(enemy_sequence);
	enemy_sequence = layer_sequence_create(layer_enemy,x,y,seq);
	layer_sequence_xscale(enemy_sequence,image_xscale);
	layer_sequence_yscale(enemy_sequence,image_yscale);
	layer_sequence_speedscale(enemy_sequence,spd);
	if(pos = 0)p = 0;
	if(pos = 1)p = layer_sequence_get_length(enemy_sequence);
	layer_sequence_headpos(enemy_sequence,p);
	layer_sequence_headdir(enemy_sequence,dir);
}

SetMoveEnabled = function(enabled){
	move_enabled = enabled;
	Anim_Pause(id,"x",!enabled);
	Anim_Pause(id,"y",!enabled);
}

OnDie = function(){}

SetBurn = function(b){
	burn_duration = b;
	if(b > 0){
		for(i=0;i<irandom_range(3,5);i+=1){
			xx = random_range(bbox_left,bbox_right);
			yy = random_range(bbox_top,bbox_bottom);
			instance_create_depth(xx,yy,depth-1,effect_enemy_fire);
		}
	}
	else{
		Anim_Create(id,"effect_alpha",0,0,effect_alpha,-effect_alpha,10);
		Anim_Create(id,"effect_type",0,0,effect_type,-effect_type,0,10);
	}
}

SetFrozen = function(f){
	frozen_duration = f;
	SetMoveEnabled(!f);
	bullet_emitter.enabled = !f;
	if(f > 0){
		effect_type = 0;
		effect_alpha = 0.5;
		SetFlame(-1,-1);
		layer_sequence_speedscale(enemy_sequence,0);
		frozen_time = 120;
	}
	else{
		effect_alpha = 0;
		SetFlame(flame_lower,flame_upper);
		layer_sequence_speedscale(enemy_sequence,1);
	}
}