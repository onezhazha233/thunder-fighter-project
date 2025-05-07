if(collision_type = 0){
	enemy = collision_rectangle(x-left*scale_x,y-up*scale_y,x+right*scale_x,y+down*scale_y,enemy_agent,1,1);
	if!(enemy = noone){
		if(enemy.collision_type = 1){
			event_user(0);
			with(enemy)event_user(0);
		}
	}
}
if(collision_type = 1){
	enemy = instance_place(x,y,enemy_agent);
	if!(enemy = noone){
		if(enemy.collision_type = 1){
			event_user(0);
			with(enemy)event_user(0);
		}
	}
}