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
					other.mode = 2;
					layer_sequence_destroy(bullet_sequence);
					bullet_sequence = layer_sequence_create(ll,x,y,edge_intro);
					layer_sequence_xscale(bullet_sequence,scale_x*(dir = 1 ? -1 : 1));
				}
			}
		}
	
		enemy = collision_rectangle(x-left*scale_x,y-up*scale_y,x+right*scale_x,y+down*scale_y,enemy_agent,1,1);
		if(instance_exists(enemy)){
			if(enemy.collision_type = COLLISION_TYPE.SPRITE){
				mode = 2;
				layer_sequence_destroy(bullet_sequence);
				bullet_sequence = layer_sequence_create(ll,x,y,edge_intro);
				layer_sequence_xscale(bullet_sequence,scale_x*(dir = 1 ? -1 : 1));
				speed = 0;
			}
		}
	}
	if(collision_type = COLLISION_TYPE.SPRITE){
		with(enemy_agent){
			bullet = collision_rectangle(x-left*image_xscale,y-up*image_yscale,x+right*image_xscale,y+down*image_yscale,other,1,1);
			if(instance_exists(bullet)){
				if(collision_type = COLLISION_TYPE.RECTANGLE){
					other.mode = 2;
					with(other){
						layer_sequence_destroy(bullet_sequence);
						bullet_sequence = layer_sequence_create(ll,x,y,edge_intro);
						layer_sequence_xscale(bullet_sequence,scale_x*(dir = 1 ? -1 : 1));
						speed = 0;
					}
				}
			}
		}
	
		enemy = instance_place(x,y,enemy_agent);
		if(instance_exists(enemy)){
			if(enemy.inv_collision = false){
				if(enemy.collision_type = COLLISION_TYPE.SPRITE){
					other.mode = 2;
					with(other){
						layer_sequence_destroy(bullet_sequence);
						bullet_sequence = layer_sequence_create(ll,x,y,edge_intro);
						layer_sequence_xscale(bullet_sequence,scale_x*(dir = 1 ? -1 : 1));
						speed = 0;
					}
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
		num = collision_circle_list(x,y,range*scale_x,enemy_agent,1,1,enemy_list,0);
		if(num > 0){
			for(i=0;i<ds_list_size(enemy_list);i+=1){
				dirr = point_direction(x,y,enemy_list[|i].x,enemy_list[|i].y);
				find = laser_find(x,y,dirr,range*scale_x,enemy_list[|i],1,1);
				len = find[0];
				enemy = find[1];
				CollideEnemy(enemy);
			}
			ds_list_clear(enemy_list);
		}
	}
	
	if(image_alpha <= 0)instance_destroy();
}