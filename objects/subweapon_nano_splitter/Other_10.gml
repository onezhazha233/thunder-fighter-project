live;
damage = 1.741
switch(weapon_level){
	case 0:damage = 1.741*global.atk_subweapon;break;
	case 1:damage = 1.95*global.atk_subweapon;break;
	case 2:damage = 2.05*global.atk_subweapon;break;
	case 3:damage = 1.928*global.atk_subweapon;break;
}

a = MakePlayerBullet(x-35*scale_x,y,bullet_player_splitter,seq_splitter_d_intro)
a.idle = seq_splitter_d
a.small_sequence = seq_splitter_d_small
a.collision_effect_sequence = seq_bullet_effect_dawn_d
a.direction = 90
enemy = find_priority_enemy(bullet_player_splitter)
if(instance_exists(enemy)){
	a.direction = point_direction(a.x,a.y,enemy.x,enemy.y);
}
a.image_angle = a.direction - 90
a.speed = 20
a.track_inst = enemy
a.damage = damage

a = MakePlayerBullet(x+35*scale_x,y,bullet_player_splitter,seq_splitter_d_intro)
a.idle = seq_splitter_d
a.small_sequence = seq_splitter_d_small
a.collision_effect_sequence = seq_bullet_effect_dawn_d
a.direction = 90
enemy = find_priority_enemy(bullet_player_splitter)
if(instance_exists(enemy)){
	a.direction = point_direction(a.x,a.y,enemy.x,enemy.y);
}
a.image_angle = a.direction - 90
a.speed = 20
a.track_inst = enemy
a.damage = damage