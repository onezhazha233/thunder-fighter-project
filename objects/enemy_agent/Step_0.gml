live;
if(hp <= 0){
	if(object_exists(explosion)){
		instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,explosion);
	}
	instance_destroy();
}
hurt_time = max(0,hurt_time-1)

image_blend = make_color_rgb(blend_r,blend_g,blend_b)

if(layer_sequence_is_finished(enemy_sequence)){
	if(layer_sequence_get_headdir(enemy_sequence) = seqdir_right){
		if(state = 1){
			SetState(2);
		}
	}
	if(state = 3){
		SetState(0);
	}
}

SetPosition(x,y)

if(collision_type = 0){
	with(bullet_player){
	    var enemy_up = other.y - other.up*other.scale_x;
	    var enemy_down = other.y + other.down*other.scale_y;
	    var enemy_left = other.x - other.left*other.scale_x;
	    var enemy_right = other.x + other.right*other.scale_y;
	
	    var bullet_up = y - up*image_xscale;
	    var bullet_down = y + down*image_yscale;
	    var bullet_left = x - left*image_xscale;
	    var bullet_right = x + right*image_yscale;
	
		if(collision_type = 0){
		    if (enemy_up <= bullet_down && enemy_down >= bullet_up &&
		        enemy_left <= bullet_right && enemy_right >= bullet_left) {
				enemy = other.id;
		        with(other)event_user(0);
				event_user(0);
		    }
		}
	}
	bullet = collision_rectangle(x-left*image_xscale,y-up*image_yscale,x+right*image_xscale,y+down*image_yscale,bullet_player,1,1)
	if(instance_exists(bullet)){
		if(bullet.collision_type = 1){
			bullet.enemy = id;
			with(other)event_user(0);
			event_user(0);
		}
	}
	player_point = collision_rectangle(x-left*image_xscale,y-up*image_yscale,x+right*image_xscale,y+down*image_yscale,player,1,1)
	if(instance_exists(player_point)){
		if(global.inv = 0){
			global.hp -= damage;
			with(player)event_user(0);
		}
	}
}
if(collision_type = 1){
	with(bullet_player){
		if(collision_type = 0){
			if(collision_rectangle(x-left*scale_x,y-up*scale_y,x+right*scale_x,y+down*scale_y,other,1,1)){
				enemy = other.id;
				with(other)event_user(0);
				event_user(0);
			}
		}
	}
	
	bullet = instance_place(x,y,bullet_player);
	if(instance_exists(bullet)){
		if(collision_type = 1){
			//bullet.enemy = id;
			//with(bullet)event_user(0);
			//event_user(0);
		}
	}
	player_point = instance_place(x,y,player);
	if(instance_exists(player_point)){
		if(global.inv = 0){
			global.hp -= damage;
			with(player)event_user(0);
		}
	}
}