if(layer_sequence_exists("bullets_player",sequence)){
	layer_sequence_x(sequence,x);
	layer_sequence_y(sequence,y);
	layer_sequence_xscale(sequence,image_xscale);
	layer_sequence_yscale(sequence,image_yscale);
	layer_sequence_angle(sequence,image_angle);
}

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

if(collision_type = COLLISION_TYPE.RECTANGLE){
	with(enemy_agent){
		var enemy_up = y - up*image_xscale;
		var enemy_down = y + down*image_yscale;
		var enemy_left = x - left*image_xscale;
		var enemy_right = x + right*image_yscale;
	
		var bullet_up = other.y - other.up*other.scale_x;
		var bullet_down = other.y + other.down*other.scale_y;
		var bullet_left = other.x - other.left*other.scale_x;
		var bullet_right = other.x + other.right*other.scale_y;
		
		if(rectangle_in_rectangle(enemy_left,enemy_up,enemy_right,enemy_down,bullet_left,bullet_up,bullet_right,bullet_down) > 0){
			if(collision_type = COLLISION_TYPE.RECTANGLE){
				other.enemy = id;
				other.CollideEnemy(id);
			}
		}
	}
	
	enemy = collision_rectangle(x-left*scale_x,y-up*scale_y,x+right*scale_x,y+down*scale_y,enemy_agent,1,1);
	if(instance_exists(enemy)){
		if(enemy.collision_type = COLLISION_TYPE.SPRITE){
			CollideEnemy(enemy);
		}
	}
}
if(collision_type = COLLISION_TYPE.SPRITE){
	with(enemy_agent){
		bullet = collision_rectangle(x-left*image_xscale,y-up*image_yscale,x+right*image_xscale,y+down*image_yscale,other,1,1);
		if(instance_exists(bullet)){
			if(collision_type = COLLISION_TYPE.RECTANGLE){
				other.enemy = id;
				other.CollideEnemy(id);
			}
		}
	}
	
	enemy = instance_place(x,y,enemy_agent);
	if(instance_exists(enemy)){
		if(enemy.inv_collision = false){
			if(enemy.collision_type = COLLISION_TYPE.SPRITE){
				CollideEnemy(enemy);
			}
		}
	}
}