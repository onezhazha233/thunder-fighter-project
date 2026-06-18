live;
if!(layer_exists(layer_enemy)){
	layer_enemy = layer_create(depth);
}
if!(layer_exists(layer_enemy_lower)){
	layer_enemy_lower = layer_create(depth+1);
}
if!(layer_exists(layer_enemy_upper)){
	layer_enemy_upper = layer_create(depth-1);
}

if!(depth_previous = depth){
	layer_depth(layer_enemy,depth);
	layer_depth(layer_enemy_lower,depth+1);
	layer_depth(layer_enemy_upper,depth-1);
}

if(hp <= 0){
	ii = CreateItem();
	alarm[2] = 1;
	active = false;
	with(enemy_agent)hp = 0;
	Swarm_SetEnabled(false);
	with(battle_wave_swarm)instance_destroy();
	
	if(array_length(boss_list) = 0){
		if!(die_sequence = -1){
			layer_sequence_create(global.layer_enemies_die,x,y,die_sequence);
		}
		if(object_exists(explosion)){
			eff = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,explosion);
			eff.box = [bbox_left,bbox_top,bbox_right,bbox_bottom];
		}
		battle_ui.boss_hpbar_hp = 0;
		Anim_Create(battle_ui,"boss_hpbar_enabled",0,0,1,-1,0,180);
		Anim_Create(battle_wave,"enabled",0,0,0,1,0,240);
		Player_SetBreaktime(true);
		BGM_SetVolume(1,0,60);
		battle.alarm[2] = 240;
		OnDie();
	}
	else{
		instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,effect_explosion_big);
		a = instance_create_depth(x,y,depth,boss_list[0]);
		a.move_start_duration = 30;
		a.ApplySpawnFromPrevious(x,y);
		a.phase = phase + 1;
		battle_ui.boss_hpbar_hp = 1;
		battle_ui.boss_hpbar_hp_max = 1;
		array_delete(boss_list,0,1);
		a.boss_list = boss_list;
		Swarm_SetEnabled(true);
		for(i=0;i<array_length(ii);i+=1){
			ii[i].direction = random_range(-135,-45);
		}
	}
}

hurt_time = max(0,hurt_time-1)

image_blend = make_color_rgb(blend_r,blend_g,blend_b)

if(active = true){
	if(boss_hpbar_enabled = true){
		var _total_phases = array_length(boss_list) + 1;
		if(_total_phases < 1) _total_phases = 1;
		battle_ui.boss_hpbar_phase = _total_phases - 1;
		battle_ui.boss_hpbar_hp_max = hp_max;
		battle_ui.boss_hpbar_hp = hp;
	}
	
	if(start = 1){
		time += 1;
		
	}
}

if(layer_sequence_is_finished(enemy_sequence)){
	if(layer_sequence_get_headdir(enemy_sequence) = seqdir_right){
		if(state = ENEMY_STATE.INTRO){
			SetIdle();
		}
		if(state = ENEMY_STATE.IDLE){
			for(i=0;i<array_length(auto_idle_sequence);i+=1){
				ss = sequence_get(auto_idle_sequence[i]);
				if(layer_sequence_get_sequence(enemy_sequence) = ss){
					SetIdle();
					break;
				}
			}
		}
	}
}

if(inv_collision = false){
	if!(Player_IsBreaktime()){
		if(collision_type = 0){
			player_point = collision_rectangle(x-left*image_xscale,y-up*image_yscale,x+right*image_xscale,y+down*image_yscale,player,1,1);
			if(instance_exists(player_point)){
				if(global.inv_hurt = 0&&global.inv_shield = 0){
					Player_Hurt(damage);
					Player_CallHurtEvent();
				}
			}
		}
		if(collision_type = 1){
			player_point = instance_place(x,y,player);
			if(instance_exists(player_point)){
				if(global.inv_hurt = 0&&global.inv_shield = 0){
					Player_Hurt(damage);
					Player_CallHurtEvent();
				}
			}
		}
	}
}