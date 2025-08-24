live;
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

if(collision_type = COLLISION_TYPE.SPRITE){
	enemy = instance_place(x,y,enemy_agent);
	if(instance_exists(enemy)){
		if(enemy.inv_collision = false){
			CollideSingleEnemy(enemy);
		}
	}
}