live;
damage = 4.0625
switch(weapon_level){
	case 0:damage = 4.0625*global.atk_subweapon;break;
	case 1:damage = 4.55*global.atk_subweapon;break;
	case 2:damage = 4.78125*global.atk_subweapon;break;
	case 3:damage = 4.5*global.atk_subweapon;break;
}

a = MakePlayerBullet(x-35*scale_x,y,bullet_player_laser)
a.sprite_index = spr_laser_b
a.direction = 90
enemy = find_priority_enemy(bullet_player_laser)
if(instance_exists(enemy)){
	a.direction = point_direction(a.x,a.y,enemy.x,enemy.y);
}
a.image_angle = a.direction - 90
a.speed = 45
a.track_inst = enemy
a.damage = damage

a = MakePlayerBullet(x+35*scale_x,y,bullet_player_laser)
a.sprite_index = spr_laser_b
a.direction = 90
enemy = find_priority_enemy(bullet_player_laser)
if(instance_exists(enemy)){
	a.direction = point_direction(a.x,a.y,enemy.x,enemy.y);
}
a.image_angle = a.direction - 90
a.speed = 45
a.track_inst = enemy
a.damage = damage