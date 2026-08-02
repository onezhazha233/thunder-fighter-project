live;
event_inherited();

SetState = function(s){
	state = s;
	// 状态切换统一采用「先创建新序列 → 立即配置 → 把新 ID 正确写回 enemy_sequence_i → 再销毁旧序列」。
	// 原因：本 boss 走 surface 渲染管线（每帧 Draw Begin 会清空 surf），
	// 如果某一帧层上缺元素、或新序列没被 SetPosition 正确追踪（旧代码 variable_instance_set(id,eseq,...) 传的是元素 ID 而非变量名），
	// surf 就会是空的 → boss 整个闪没 1 帧。
	var _swap = function(_idx,_seq){
		var _l = variable_instance_get(id,"layer_enemy_"+string(_idx));
		var _old = variable_instance_get(id,"enemy_sequence_"+string(_idx));
		var _new = layer_sequence_create(_l,x,y,_seq);
		layer_sequence_xscale(_new,image_xscale);
		layer_sequence_yscale(_new,image_yscale);
		variable_instance_set(id,"enemy_sequence_"+string(_idx),_new);
		layer_sequence_destroy(_old);
		return _new;
	}
	if(s = ENEMY_STATE.PRE){
		eseq = _swap(0,intro_sequence);
		layer_sequence_speedscale(eseq,0);
		layer_sequence_headpos(eseq,0);
		for(i=1;i<5;i+=1){
			layer_sequence_destroy(variable_instance_get(id,"enemy_sequence_"+string(i)));
			variable_instance_set(id,"enemy_sequence_"+string(i),-1);
		}
	}
	if(s = ENEMY_STATE.INTRO){
		_swap(0,intro_sequence);
		for(i=1;i<5;i+=1){
			layer_sequence_destroy(variable_instance_get(id,"enemy_sequence_"+string(i)));
			variable_instance_set(id,"enemy_sequence_"+string(i),-1);
		}
	}
	if(s = ENEMY_STATE.IDLE){
		start = 1;
		if(instance_exists(bullet_emitter_inst)){
			bullet_emitter_inst.enabled = true;
		}
		Player_SetBreaktime(false);
		inv_collision = false;
		for(i=0;i<5;i+=1){
			seq = variable_instance_get(id,"idle_sequence_"+string(i));
			_swap(i,seq);
		}
	}
	SetPosition(x,y);
}

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	if(instance_exists(bullet_emitter_inst)){
		bullet_emitter_inst.x = xx;
		bullet_emitter_inst.y = yy;
	}
	
	for(i=0;i<5;i+=1){
		eseq = variable_instance_get(id,"enemy_sequence_"+string(i));
		if(layer_sequence_exists(variable_instance_get(id,"layer_enemy_"+string(i)),eseq)){
			layer_sequence_x(eseq,x-surf_x*surf_enabled);
			layer_sequence_y(eseq,y-surf_y*surf_enabled);
			layer_sequence_xscale(eseq,image_xscale);
			layer_sequence_yscale(eseq,image_yscale);
			if(i = 1){
				layer_sequence_angle(eseq,ring_angle);
			}
			else if(i = 3){
				layer_sequence_angle(eseq,gun_angle);
			}
			else{
				layer_sequence_angle(eseq,image_angle);
			}
			layer_sequence_blend(eseq,image_blend);
			layer_sequence_alpha(eseq,image_alpha);
		}
	}
}

SetSurfEnabled = function(enabled){
	surf_enabled = enabled;
	var scrBegin = function(){
		if (event_number != ev_draw_normal) return;
		if(surf_enabled = true&&surface_exists(surf))surface_set_target(surf);
		gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
	}
	var scrEnd = function(){
		if (event_number != ev_draw_normal) return;
		
		gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
	    draw_surface_ext(surf_effect, 0, 0, 1, 1, 0, c_white, 1);
		
		if(surf_enabled = true&&surface_exists(surf))surface_reset_target();
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
	var scrEndUpper = function(){
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
		if(surf_enabled = true){
			gpu_set_blendmode_ext_sepalpha(bm_one,bm_inv_src_alpha,bm_one,bm_one);
			draw_surface(surf,surf_x,surf_y);
			gpu_set_blendmode(bm_normal);
			if(effect_alpha > 0){
				surface_set_target(surf_effect);
				draw_clear_alpha(c_black,0);
				if(effect_type = 0){
					for(var i=0;i<6;i+=1){
						for(var j=0;j<5;j+=1){
							draw_sprite_ext(spr_effect_texture_ice,0,512*i-256,512*j,1,1,0,-1,effect_alpha);
						}
					}
				}
				if(effect_type = 1){
					for(var i=0;i<6;i+=1){
						for(var j=0;j<5;j+=1){
							for(var k=0;k<512;k+=4){
								draw_sprite_part_ext(spr_effect_texture_fire,0,0,k,512,4,512*i+sin(k/30+time/20)*20-256,512*j+k,1,1,-1,effect_alpha);
							}
						}
					}
				}
				surface_reset_target();
			}
		}
	}
		
	for(i=0;i<4;i+=1){
		l = variable_instance_get(id,"layer_enemy_"+string(i));
		layer_script_begin(l,scrBegin);
		layer_script_end(l,scrEnd);
	}
	l = variable_instance_get(id,"layer_enemy_4");
	layer_script_begin(l,scrBegin);
	layer_script_end(l,scrEndUpper);
	
	SetPosition(x,y);
}

SetMoveInfo = function(){
	move_range = [200,250,720-200,350];
	move_distance = [100,160];
	move_duration = [80,120];
	move_interval = [20,30];
}

SetIdle = function(duration=30){
	Anim_Destroy(id,"ring_angle");
	Anim_Destroy(id,"gun_angle");
	ring_angle = ring_angle mod 120;
	gun_angle = gun_angle mod 120;
	Anim_Create(id,"ring_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,ring_angle,-ring_angle,duration);
	Anim_Create(id,"gun_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,gun_angle,-gun_angle,duration);
	SetState(ENEMY_STATE.IDLE);
}