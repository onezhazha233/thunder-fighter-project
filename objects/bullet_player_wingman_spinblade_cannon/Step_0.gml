if(damage_type = 1){
	var _keys = ds_map_find_first(collision_enemy);
	while (!is_undefined(_keys)) {
	    var _time = ds_map_find_value(collision_enemy, _keys) - 1;
	    if (_time <= 0) {
	        var _next_key = ds_map_find_next(collision_enemy, _keys);
	        ds_map_delete(collision_enemy, _keys);
	        _keys = _next_key;
	    } else {
	        ds_map_replace(collision_enemy, _keys, _time);
	        _keys = ds_map_find_next(collision_enemy, _keys);
	    }
	}
}

if(mode < 2){
	if(collision_type = COLLISION_TYPE.SPRITE){
		enemy = instance_place(x,y,enemy_agent);
		if(instance_exists(enemy)){
			if(enemy.inv_collision = false){
				if(enemy.collision_type = COLLISION_TYPE.SPRITE){
					mode = 2;
					layer_sequence_destroy(bullet_sequence);
					bullet_sequence = layer_sequence_create(ll,x,y,edge_intro);
					layer_sequence_xscale(bullet_sequence,scale_x*(dir = 1 ? -1 : 1));
					speed = 0;
				}
			}
		}
	}
	
	move_duration -= 1;
	if(move_duration = 0){
		mode = 2;
		layer_sequence_destroy(bullet_sequence);
		bullet_sequence = layer_sequence_create(ll,x,y,edge_intro);
		layer_sequence_xscale(bullet_sequence,scale_x*(dir = 1 ? -1 : 1));
		speed = 0;
	}
}
if(mode >= 2){
	duration -= 1;
	if(duration = 0){
		Anim_Create(id,"image_alpha",0,0,1,-1,44);
		Anim_Create(id,"animspd",0,0,1,-1,44);
		mode = 4;
	}
	
	if(duration > 0){
		enemy_num = collision_circle_list(x,y,range*scale_x,enemy_agent,1,1,enemy_list,0);
		if(enemy_num > 0){
			CollideEnemies();
		}
	}
	
	if(image_alpha <= 0)instance_destroy();
}