live;
if(visible = true){
	if(place_meeting(x,y,bullet_enemy)&&global.inv_hurt = 0&&global.inv_shield = 0&&global.inv_cutscene = 0){
		//event_user(0);
	}
	
	if(moveable = true){
		var touch_index = 0;
		var is_touching = device_mouse_check_button(touch_index, mb_left);

		if(is_touching){
		    if(!variable_struct_exists(id, "touch_active")||!touch_active){
		        touch_active = true;
		        touch_start_x = device_mouse_x(touch_index);
		        touch_start_y = device_mouse_y(touch_index);
		        obj_start_x = x;
		        obj_start_y = y;
		    }

		    var dx = device_mouse_x(touch_index) - touch_start_x;
		    var dy = device_mouse_y(touch_index) - touch_start_y;
		    x = obj_start_x + dx;
		    y = obj_start_y + dy;

		}
		else{
		    touch_active = false;
		}
	
		x += (keyboard_check(vk_right) - keyboard_check(vk_left))*global.player_move_speed/(1+keyboard_check(vk_lshift));
		y += (keyboard_check(vk_down) - keyboard_check(vk_up))*global.player_move_speed/(1+keyboard_check(vk_lshift));
	
		x = clamp(20,x,room_width-20);
		y = clamp(20,y,room_height-20);
	}
	
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
		else{
			equipment.image_alpha = 1;
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
		world.alarm[0] = 120;
	}
}