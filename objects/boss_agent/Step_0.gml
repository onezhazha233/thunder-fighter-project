live;
if!(depth_previous = depth){
	layer_depth(layer_enemy,depth);
	layer_depth(layer_enemy_lower,depth+1);
	layer_depth(layer_enemy_upper,depth-1);
}

if(hp <= 0){
	instance_destroy();
	if!(object_exists(next_boss)){
		if!(die_sequence = -1){
			layer_sequence_create("enemies",x,y,die_sequence);
		}
		if(object_exists(explosion)){
			instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,explosion);
		}
	}
	else{
		phase += 1;
		instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,effect_explosion_big);
		a = instance_create_depth(x,y,depth,next_boss);
		a.move_start_duration = 30;
		a.skip = true;
	}
}

hurt_time = max(0,hurt_time-1)

image_blend = make_color_rgb(blend_r,blend_g,blend_b)

if(start = 1){
	time += 1;
}

if(layer_sequence_is_finished(enemy_sequence)){
	if(layer_sequence_get_headdir(enemy_sequence) = seqdir_right){
		if(state = 1){
			SetState(2);
		}
	}
}

SetPosition(x,y)

if(inv_collision = false){
	if(collision_type = 0){
		player_point = collision_rectangle(x-left*image_xscale,y-up*image_yscale,x+right*image_xscale,y+down*image_yscale,player,1,1);
		if(instance_exists(player_point)){
			if(global.inv_hurt = 0&&global.inv_shield = 0){
				Player_CallHurtEvent();
				Player_Hurt(damage);
			}
		}
	}
	if(collision_type = 1){
		player_point = instance_place(x,y,player);
		if(instance_exists(player_point)){
			if(global.inv_hurt = 0&&global.inv_shield = 0){
				Player_CallHurtEvent();
				Player_Hurt(damage);
			}
		}
	}
}