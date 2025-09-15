live;
if!(depth_previous = depth){
	layer_depth(layer_enemy,depth);
	layer_depth(layer_enemy_lower,depth+1);
	layer_depth(layer_enemy_upper,depth-1);
}

if(hp <= 0){
	ii = CreateItem();
	for(i=0;i<array_length(ii);i+=1){
		ii[i].direction = random_range(-135,-45);
	}
	alarm[2] = 1;
	active = false;
	
	if(array_length(boss_list) = 0){
		if!(die_sequence = -1){
			layer_sequence_create(global.layer_enemies_die,x,y,die_sequence);
		}
		if(object_exists(explosion)){
			instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,explosion);
		}
		battle_ui.boss_hpbar_hp = 0;
		Anim_Create(battle_ui,"boss_hpbar_enabled",0,0,1,-1,0,180);
		Anim_Create(battle_wave,"enabled",0,0,0,1,0,240);
		global.inv_cutscene = 1;
		player.equipment.SetEnabled(false);
	}
	else{
		instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,effect_explosion_big);
		a = instance_create_depth(x,y,depth,boss_list[0]);
		a.move_start_duration = 30;
		a.skip = true;
		a.phase = phase + 1;
		battle_ui.boss_hpbar_hp = 1;
		battle_ui.boss_hpbar_hp_max = 1;
		array_delete(boss_list,0,1);
		a.boss_list = boss_list;
		
	}
}

hurt_time = max(0,hurt_time-1)

image_blend = make_color_rgb(blend_r,blend_g,blend_b)

if(active = true){
	if(boss_hpbar_enabled = true){
		battle_ui.boss_hpbar_hp_max = hp_max;
		battle_ui.boss_hpbar_hp = hp;
	}
	
	if(start = 1){
		time += 1;
		if(start = 1){
			if(move_enabled = true){
				if(move_state = 0){
				    if(time-move_starttime >= move_nexttime){
				        var centerX = (move_range[0] + move_range[2]) / 2;
					    var centerY = (move_range[1] + move_range[3]) / 2;
    
					    var dir;
					    var distance = random_range(move_distance[0],move_distance[1]);
    
					    if ((x - move_range[0] < 30) || (move_range[2] - x < 30) ||(y - move_range[1] < 30) || (move_range[3] - y < 30)) {
					        // 朝向中心方向（角度制）
					        dir = point_direction(x, y, centerX, centerY);
					        // 添加 ±30 度随机偏移
					        dir += random_range(-30, 30);
					    } else {
					        dir = random(360); // 完全随机方向
					    }
    
					    var newTargetX = x + lengthdir_x(distance, dir);
					    var newTargetY = y + lengthdir_y(distance, dir);
    
					    // 动态 margin
					    var marginX = min(10, (move_range[2] - move_range[0]) / 2 - 1);
					    var marginY = min(10, (move_range[3] - move_range[1]) / 2 - 1);

					    newTargetX = clamp(newTargetX, move_range[0] + marginX, move_range[2] - marginX);
					    newTargetY = clamp(newTargetY, move_range[1] + marginY, move_range[3] - marginY);
			
						move_targetpos = [newTargetX,newTargetY]
					    moveStartTime = time - move_starttime;
					    moveDuration = random_range(move_duration[0],move_duration[1]);
					    move_state = 1;
    
					    // 使用 Anim_Create 移动
					    Anim_Create(id, "x", 0, 0, x, move_targetpos[0] - x, moveDuration);
					    Anim_Create(id, "y", 0, 0, y, move_targetpos[1] - y, moveDuration);
				    }
				}
				else if(move_state = 1){
				    if((x <= move_range[0]||x >= move_range[2]||y <= move_range[1]||y >= move_range[3])||(!Anim_IsExists(id))){
				        x = clamp(x, move_range[0], move_range[2]);
					    y = clamp(y, move_range[1], move_range[3]);
    
					    move_nexttime = time + random_range(move_interval[0],move_interval[1]);
					    move_state = 0;
				    }
				}
			}
		}
	}
}

if(layer_sequence_is_finished(enemy_sequence)){
	if(layer_sequence_get_headdir(enemy_sequence) = seqdir_right){
		if(state = 1){
			SetState(2);
		}
	}
}

if(inv_collision = false){
	if(collision_type = 0){
		player_point = collision_rectangle(x-left*image_xscale,y-up*image_yscale,x+right*image_xscale,y+down*image_yscale,player,1,1);
		if(instance_exists(player_point)){
			if(global.inv_hurt = 0&&global.inv_shield = 0){
				Player_CallHurtEvent();
				Player_Hurt(damage);
			}
		}
	}
	if(collision_type = 1){
		player_point = instance_place(x,y,player);
		if(instance_exists(player_point)){
			if(global.inv_hurt = 0&&global.inv_shield = 0){
				Player_CallHurtEvent();
				Player_Hurt(damage);
			}
		}
	}
}