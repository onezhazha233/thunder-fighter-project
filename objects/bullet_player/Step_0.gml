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

if(collision_single = false){
	if(collision_type = COLLISION_TYPE.RECTANGLE){
		enemy_num = collision_rectangle_list(x-left*scale_x,y-up*scale_y,x+right*scale_x,y+down*scale_y,enemy_agent,1,1,enemy_list,false);
		if(enemy_num > 0){
			CollideEnemies();
		}
	}
	if(collision_type = COLLISION_TYPE.SPRITE){
		enemy_num = instance_place_list(x,y,enemy_agent,enemy_list,false);
		if(enemy_num > 0){
			CollideEnemies();
		}
	}
}
else{
	if(collision_type = COLLISION_TYPE.RECTANGLE){
		enemy = collision_rectangle(x-left*scale_x,y-up*scale_y,x+right*scale_x,y+down*scale_y,enemy_agent,1,1);
		if(instance_exists(enemy)){
			if(enemy.inv_collision = false){
				if(enemy.collision_type = COLLISION_TYPE.SPRITE){
					CollideSingleEnemy(enemy);
					if(collision_destroy = true){
						instance_destroy();
					}
				}
			}
		}
	}
	if(collision_type = COLLISION_TYPE.SPRITE){
		enemy = instance_place(x,y,enemy_agent);
		if(instance_exists(enemy)){
			if(enemy.inv_collision = false){
				if(enemy.collision_type = COLLISION_TYPE.SPRITE){
					CollideSingleEnemy(enemy);
					if(collision_destroy = true){
						instance_destroy();
					}
				}
			}
		}
	}
}

duration -= 1
if(duration = 0)instance_destroy();