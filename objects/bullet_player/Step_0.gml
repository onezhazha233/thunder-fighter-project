if(collision_type = 1){
	enemy = instance_place(x,y,enemy_agent);
	if!(enemy = noone){
		if(enemy.inv_collision = false){
			if(enemy.collision_type = 1){
				if(collision_destroy = true){
					instance_destroy();
				}
				if(enemy.inv_damage = false)event_user(0);
				with(enemy)event_user(0);
			}
		}
	}
}