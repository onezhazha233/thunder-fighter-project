collision_type = COLLISION_TYPE.RECTANGLE
up = 10
down = 10
left = 10
right = 10
bullet_sequence = -1
collision_destroy = true
auto_destroy = true
auto_destroy_delay = 60
collision_effect = noone
damage = 1

scale_x = 1
scale_y = 1

damage_type = 0//0为帧伤 1为碰到敌人后对该敌人失效一段时间
collision_enemy = ds_map_create()
damage_interval = 1//无效时间间隔

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
				spr_bullet_player_mega_c_start = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
				spr_bullet_player_mega_c_start.image_xscale = scale_x;
				spr_bullet_player_mega_c_start.image_yscale = scale_y;
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
			spr_bullet_player_mega_c_start = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,collision_effect);
			spr_bullet_player_mega_c_start.image_xscale = scale_x;
			spr_bullet_player_mega_c_start.image_yscale = scale_y;
		}
	}
}