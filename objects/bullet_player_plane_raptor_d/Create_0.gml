live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

rampage = false

collision_effect = bullet_player_raptor_explosion

damage = 0.25

function CollideEnemy(enemy){
	if(damage_type = 1){
		if!(ds_map_exists(collision_enemy,enemy)){
			ds_map_add(collision_enemy,enemy,damage_interval);
			if(enemy.inv_damage = false)event_user(0);
			enemy.Hurt();
			if(collision_destroy = true){
				instance_destroy();
			}
			if!(collision_effect = noone){
				spr_bullet_player_mega_c_start = instance_create_depth(x+lengthdir_x(10*scale_x,image_angle+90),y+lengthdir_y(10*scale_y,image_angle+90),DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
				spr_bullet_player_mega_c_start.image_xscale = scale_x*(rampage = true ? 1 : 0.6);
				spr_bullet_player_mega_c_start.image_yscale = scale_y*(rampage = true ? 1 : 0.6);
				spr_bullet_player_mega_c_start.damage = damage;
				with(spr_bullet_player_mega_c_start)ds_map_add(collision_enemy,enemy,damage_interval);
			}
		}
	}
	else{
		if(enemy.inv_damage = false)event_user(0);
		enemy.Hurt();
		if(collision_destroy = true){
			instance_destroy();
		}
		if!(collision_effect = noone){
			spr_bullet_player_mega_c_start = instance_create_depth(x+lengthdir_x(10*scale_x,image_angle+90),y+lengthdir_y(10*scale_y,image_angle+90),DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
			spr_bullet_player_mega_c_start.image_xscale = scale_x*(rampage = true ? 1 : 0.6);
			spr_bullet_player_mega_c_start.image_yscale = scale_y*(rampage = true ? 1 : 0.6);
			spr_bullet_player_mega_c_start.damage = damage;
			with(spr_bullet_player_mega_c_start)ds_map_add(collision_enemy,enemy,damage_interval);
		}
	}
}