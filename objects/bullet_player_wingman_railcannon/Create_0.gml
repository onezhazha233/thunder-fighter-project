live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

damage = 1
damage_type = 1
damage_interval = 999
collision_destroy = false

collision_effect = bullet_effect_railcannon
collision_effect_sequence = seq_bullet_effect_railcannon_a

image_speed = 0
rampage = false
time = 0

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
				a.sequence = collision_effect_sequence;
				a.image_xscale = scale_x*(rampage = true ? 1.5 : 1);
				a.image_yscale = scale_y*(rampage = true ? 1.5 : 1);
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
			a.sequence = collision_effect_sequence;
			a.image_xscale = scale_x*(rampage = true ? 1.5 : 1);
			a.image_yscale = scale_y*(rampage = true ? 1.5 : 1);
		}
	}
}