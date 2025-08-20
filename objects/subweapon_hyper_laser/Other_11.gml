live;
damage = 2*global.atk_subweapon

a = MakePlayerBullet(x-35*scale_x,y,bullet_player_laser)
a.sprite_index = spr_laser_c
a.collision_effect_ring = spr_buller_effect_laser_c_ring
a.collision_effect_lightball = spr_buller_effect_laser_c_lightball
a.direction = 90
enemy = find_priority_enemy(bullet_player_laser)
if(instance_exists(enemy)){
	a.direction = point_direction(a.x,a.y,enemy.x,enemy.y);
}
a.image_angle = a.direction - 90
a.speed = 45
a.track_inst = enemy
a.rampage = true
a.damage = damage

a = MakePlayerBullet(x+35*scale_x,y,bullet_player_laser)
a.sprite_index = spr_laser_c
a.collision_effect_ring = spr_buller_effect_laser_c_ring
a.collision_effect_lightball = spr_buller_effect_laser_c_lightball
a.direction = 90
enemy = find_priority_enemy(bullet_player_laser)
if(instance_exists(enemy)){
	a.direction = point_direction(a.x,a.y,enemy.x,enemy.y);
}
a.image_angle = a.direction - 90
a.speed = 45
a.track_inst = enemy
a.rampage = true
a.damage = damage