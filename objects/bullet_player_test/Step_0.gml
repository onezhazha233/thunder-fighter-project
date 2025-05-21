live;
if(collision_type = 1){
	enemy = instance_place(x,y,enemy_agent);
	if(instance_exists(enemy)){
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

if(enabled = true){
	if(type = 0){
		direction += rot;
		a = instance_create_depth(x,y,depth+1,bullet_player_test);
		a.image_xscale = image_xscale;
		a.image_yscale = image_yscale;
		a.direction = direction;
		a.speed = 0;
		a.type = 1;
		duration -= 1;
		if(duration = 0){
			Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,image_xscale,-image_xscale,10);
			Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,image_yscale,-image_yscale,10);
			alarm[1] = 10;
		}
	}
}
image_angle = direction