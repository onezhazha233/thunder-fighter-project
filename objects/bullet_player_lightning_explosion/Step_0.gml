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

enemy_num = collision_circle_list(x,y,100,enemy_agent,1,1,enemy_list,false);
if(enemy_num > 0){
	CollideEnemies();
}

if(layer_sequence_is_finished(seq)){
	layer_sequence_destroy(seq);
	instance_destroy();
}

Sequence_PlayByFrame("effects")