live;
event_inherited();

idle = seq_missile_ab

collision_type = COLLISION_TYPE.SPRITE

collision_effect = bullet_effect_missile
collision_effect_sequence = seq_bullet_effect_missile_a

track_inst = noone

rot_rate = 0

speed = 3

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
				effect = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
				effect.sequence = collision_effect_sequence;
				effect.image_xscale = scale_x;
				effect.image_yscale = scale_y;
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
			effect = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
			effect.sequence = collision_effect_sequence;
			effect.image_xscale = scale_x;
			effect.image_yscale = scale_y;
		}
	}
}