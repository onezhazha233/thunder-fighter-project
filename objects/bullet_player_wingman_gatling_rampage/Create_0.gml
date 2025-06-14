live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

collision_effect = bullet_effect_shotcannon

image_xscale = 0.4
image_yscale = 1.5
vspeed = -66

damage = 1

function CollideEnemy(enemy){
	if(damage_type = 1){
		if!(ds_map_exists(collision_enemy,enemy)){
			ds_map_add(collision_enemy,enemy,damage_interval);
			enemy.last_bullet = id;
			if(enemy.inv_damage = false)event_user(0);
			enemy.Hurt();
			if(collision_destroy = true){
				instance_destroy();
			}
			if!(collision_effect = noone){
				a = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
				a.image_xscale = scale_x*1.5;
				a.image_yscale = scale_y*1.5;
			}
		}
	}
	else{
		enemy.last_bullet = id;
		if(enemy.inv_damage = false)event_user(0);
		enemy.Hurt();
		if(collision_destroy = true){
			instance_destroy();
		}
		if!(collision_effect = noone){
			a = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
			a.image_xscale = scale_x*1.5;
			a.image_yscale = scale_y*1.5;
		}
	}
}