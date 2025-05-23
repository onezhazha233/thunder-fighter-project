live;
event_inherited();

up = 20
down = 20
left = 40
right = 40

image_xscale = 4.73
image_yscale = 2.58
vspeed = -45

damage = 1
damage_type = 1
damage_interval = 999
collision_destroy = false

collision_effect = bullet_effect_apex

function CollideEnemy(enemy){
	if(damage_type = 1){
		if!(ds_map_exists(collision_enemy,enemy)){
			ds_map_add(collision_enemy,enemy,damage_interval);
			if(enemy.inv_damage = false)event_user(0);
			with(enemy)event_user(0);
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
		if(enemy.inv_damage = false)event_user(0);
		with(enemy)event_user(0);
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