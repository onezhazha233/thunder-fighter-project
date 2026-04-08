live;
blt = MakePlayerBullet(x-35*scale_x,y,bullet_player_laser)
blt.sprite_index = spr_laser_c
blt.collision_effect_ring = spr_buller_effect_laser_c_ring
blt.collision_effect_lightball = spr_buller_effect_laser_c_lightball
blt.direction = 90
enemy = find_priority_enemy(bullet_player_laser)
if(instance_exists(enemy)){
	blt.direction = point_direction(blt.x,blt.y,enemy.x,enemy.y);
}
blt.image_angle = blt.direction - 90
blt.speed = 45
blt.track_inst = enemy
blt.damage = damage

blt = MakePlayerBullet(x+35*scale_x,y,bullet_player_laser)
blt.sprite_index = spr_laser_c
blt.collision_effect_ring = spr_buller_effect_laser_c_ring
blt.collision_effect_lightball = spr_buller_effect_laser_c_lightball
blt.direction = 90
enemy = find_priority_enemy(bullet_player_laser)
if(instance_exists(enemy)){
	blt.direction = point_direction(blt.x,blt.y,enemy.x,enemy.y);
}
blt.image_angle = blt.direction - 90
blt.speed = 45
blt.track_inst = enemy
blt.damage = damage