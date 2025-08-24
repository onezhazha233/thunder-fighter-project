live;
event_inherited();

battle_ui.boss_hpbar_hp_max = hp_max
battle_ui.boss_hpbar_hp = hp

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

if(keyboard_check_pressed(ord("G"))){
	move_enabled = !move_enabled;
	if(move_enabled = true){
		move_nexttime = time;
		move_state = 0;
	}
	else{
		Anim_Destroy(id);
	}
}