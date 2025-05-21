live;
if(visible = true){
	if(place_meeting(x,y,bullet_enemy)&&global.inv_hurt = 0&&global.inv_shield = 0){
		event_user(0);
	}

	if(mouse_check_button(mb_left)) {
	    var dx = (mouse_x-camera._shake_pos_x) - touch_start_x;
	    var dy = (mouse_y-camera._shake_pos_y) - touch_start_y;
    
	    x += dx;
	    y += dy;
	
		x = clamp(20,x,room_width-20);
		y = clamp(20,y,room_height-20);
	}

	touch_start_x = (mouse_x-camera._shake_pos_x);
	touch_start_y = (mouse_y-camera._shake_pos_y);
	
	if(instance_exists(equipment)){
		equipment.x = x
		equipment.y = y
		equipment.SetPosition(x,y);
	}
	
	if(instance_exists(battle_quantum_shield)){
		battle_quantum_shield.x = x;
		battle_quantum_shield.y = y;
		battle_quantum_shield.SetPosition(x,y);
	}
	
	if(instance_exists(equipment)){
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
	}
	global.inv_hurt = max(0,global.inv_hurt-1);

	if(global.hp <= 0){
		visible = false;
		instance_create_depth(x,y,0,effect_explosion_big);
		instance_create_depth(x,y,0,effect_explosion_ring_red);
		instance_create_depth(x,y,0,effect_explosion_ring_white);
		//instance_destroy();
		instance_destroy(equipment_test);
	}
	
	if(rampage_duration > 0)rampage_duration -= 1;
	if(rampage_duration = 0){
		if(instance_exists(equipment)){
			if(equipment.state = 1){
				equipment.SetRampage(0);
			}
		}
	}
}