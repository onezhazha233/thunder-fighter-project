live;
if(visible = true){
	if(place_meeting(x,y,bullet_enemy)&&global.inv_hurt = 0&&global.inv_shield = 0&&global.inv_cutscene = 0){
		event_user(0);
	}
	
	var touch_index = 0; // 使用第一个触摸点（在手机上 device_mouse 对应触摸点）

	// 检测是否正在触摸（按下）
	var is_touching = device_mouse_check_button(touch_index, mb_left);

	if (is_touching) {
	    // 如果尚未绑定触摸，初始化记录
	    if (!variable_struct_exists(id, "touch_active") || !touch_active) {
	        touch_active = true;
	        touch_start_x = device_mouse_x(touch_index);
	        touch_start_y = device_mouse_y(touch_index);
	        obj_start_x = x;
	        obj_start_y = y;
	    }

	    // 计算滑动偏移量并应用1:1移动
	    var dx = device_mouse_x(touch_index) - touch_start_x;
	    var dy = device_mouse_y(touch_index) - touch_start_y;
	    x = obj_start_x + dx;
	    y = obj_start_y + dy;

	} else {
	    // 没有触摸时，清除状态
	    touch_active = false;
	}
	
	x += (keyboard_check(vk_right) - keyboard_check(vk_left))*global.player_move_speed/(1+keyboard_check(vk_lshift));
	y += (keyboard_check(vk_down) - keyboard_check(vk_up))*global.player_move_speed/(1+keyboard_check(vk_lshift));
	
	x = clamp(20,x,room_width-20);
	y = clamp(20,y,room_height-20);
	
	if(instance_exists(battle_quantum_shield)){
		with(battle_quantum_shield){
			SetPosition(other.x,other.y);
		}
	}
	
	if(instance_exists(battle_item_effect_rampage)){
		with(battle_item_effect_rampage){
			SetPosition(player.x,player.y);
		}
	}
	
	if(graze_enabled = true){
		var _spd = point_distance(x, y, xprevious, yprevious);

		if (_spd > 5) {
			graze_time += 1;
			// --- 3. 核心：精确碰撞列表检测 ---
			// collision_circle_list 参数详解：
			// x, y, rad: 检测范围
			// obj: 检测对象 (obj_bullet)
			// prec: true <--- 【关键】开启精确碰撞，检测子弹Sprite实际形状
			// notme: false
			// list: 我们在Create里创建的那个列表
			// ordered: false (不需要按距离排序，false更快)
			var _count = collision_circle_list(x, y, graze_radius, bullet_enemy, true, false, graze_list, false);

			// --- 4. 遍历检测到的子弹 ---
			if (_count > 0) {
			    for (var i = 0; i < _count; i++) {
			        // 从列表中获取子弹的 ID
			        var _bullet_inst = graze_list[| i];
        
			        // --- 可以在这里加额外的距离判断，防止精确碰撞体积过大导致的误判 ---
			        // (由于已经开启了 prec=true，通常这里不需要再做 distance check 了)

			        // --- A. 结算分数 (基于速度) ---
					equipment.armor_inst.ArmorAbility(2,_spd);
        
			        // 速度越快，粒子越多 (限制最大数量防止卡顿)
					if(graze_time mod 2 = 0){
				        var _part_num = clamp(floor(_spd / 2), 1, 5);
						repeat(_part_num){
					        var _dir = random(360);
						    var _spd_val = random_range(effect_spd_min, effect_spd_max); // 速度随机范围
    
						    array_push(graze_effects, {
						        lx: 0, 
						        ly: 0,
						        hsp: lengthdir_x(_spd_val, _dir),
						        vsp: lengthdir_y(_spd_val, _dir),
						        life: effect_life_max,    // 填入 Create 事件定义的常量 (如30)
						        max_life: effect_life_max // 填入 Create 事件定义的常量
						    });
						}
					}
			    }
			}
		}

		// --- 5. 清空列表，供下一帧使用 ---
		// 这一步至关重要，否则列表会无限膨胀
		ds_list_clear(graze_list);
	}
	
	if(instance_exists(equipment)){
		equipment.x = x
		equipment.y = y
		equipment.SetPosition(x,y);
		
		if(global.inv_hurt > 0){
			if(global.inv_hurt mod 5 = 0){
				if(equipment.image_alpha = 1){
					equipment.image_alpha = 0.5;
				}
				else{
					equipment.image_alpha = 1;
				}
			}
		}
		
		if(rampage_duration > 0){
			if(equipment.enabled = true){
				rampage_duration -= 1;
			}
		}
		if(rampage_duration = 0){
			if(instance_exists(equipment)){
				if(equipment.state = 1){
					equipment.SetRampage(0);
				}
			}
		}
		
		if(instance_exists(equipment.armor_inst)){
			equipment.armor_inst.ArmorAbility(0);
		}
	}
	global.inv_hurt = max(0,global.inv_hurt-1);

	if(global.hp <= 0){
		visible = false;
		instance_create_depth(x,y,0,effect_explosion_big);
		instance_create_depth(x,y,0,effect_explosion_ring_red);
		instance_create_depth(x,y,0,effect_explosion_ring_white);
		//instance_destroy();
		instance_destroy(equipment_main);
		repeat(4)instance_create_depth(x,y,0,battle_item_weapon_upgrade);
		instance_create_depth(x,y,0,battle_item_quantum_shield);
	}
}