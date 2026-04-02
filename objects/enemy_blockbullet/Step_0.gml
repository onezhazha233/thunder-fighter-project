live;
image_angle += rotate

if(hp <= 0){
	if(inv_damage = false){
		destroy_type = 5;
		instance_destroy();
	}
}

if(inv_collision = false){
	if(global.inv_cutscene = 0){
		if(place_meeting(x,y,player)){
			if(global.inv_hurt = 0&&global.inv_shield = 0){
				event_user(0);
				Player_CallHurtEvent();
				if(collision_destroy = true){
					destroy_type = 2;
					instance_destroy();
				}
			}
		}
	}
}

if(ds_exists(tracks,ds_type_map)){
	var _keys = ds_map_find_first(tracks);
	while (!is_undefined(_keys)) {
		var num = ds_map_find_value(tracks, _keys);
		var _next_key = ds_map_find_next(tracks, _keys);
		if (num <= 0){
		    ds_map_delete(tracks, _keys);
		}
		_keys = _next_key;
	}
}

duration -= 1
if(duration = 0){
	destroy_type = 3;
	instance_destroy();
}

if(Player_IsEnabled()){
	if(global.inv_hurt = 0&&global.inv_shield = 0&&global.inv_cutscene = 0){
		if(place_meeting(x,y,player)){
			event_user(0);
			Player_CallHurtEvent();
			if(collision_destroy = true){
				destroy_type = 2;
				instance_destroy();
			}
		}
	}
}

if(inv_block = false){
	blk = instance_place(x,y,bullet_enemy_block);
	if(instance_exists(blk)){
		destroy_type = blk.type;
		blk.OnBlock();
		instance_destroy();
	}
}