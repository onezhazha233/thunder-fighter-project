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
				event_user(0);
				other.OnCollision(id);
			}
		}
	}
	
	enemy = collision_rectangle(x-left*scale_x,y-up*scale_y,x+right*scale_x,y+down*scale_y,enemy_agent,1,1);
	if(instance_exists(enemy)){
		if(enemy.collision_type = COLLISION_TYPE.SPRITE){
			with(enemy)event_user(0);
			OnCollision(enemy);
		}
	}
}
if(collision_type = COLLISION_TYPE.SPRITE){
	with(enemy_agent){
		bullet = collision_rectangle(x-left*image_xscale,y-up*image_yscale,x+right*image_xscale,y+down*image_yscale,other,1,1);
		if(instance_exists(bullet)){
			if(collision_type = COLLISION_TYPE.RECTANGLE){
				other.enemy = id;
				event_user(0);
				other.OnCollision(id);
			}
		}
	}
	
	enemy = instance_place(x,y,enemy_agent);
	if(instance_exists(enemy)){
		if(enemy.inv_collision = false){
			if(enemy.collision_type = COLLISION_TYPE.SPRITE){
				with(enemy)event_user(0);
				OnCollision(enemy);
			}
		}
	}
}