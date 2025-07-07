live;
damage = 1.741
switch(weapon_level){
	case 0:damage = 1.741;break;
	case 1:damage = 1.95;break;
	case 2:damage = 2.05;break;
	case 3:damage = 1.928;break;
}

a = MakePlayerBullet(x-35*scale_x,y,bullet_player_splitter,seq_splitter_a_intro)
a.direction = 90
enemy = find_priority_enemy(bullet_player_splitter)
if(instance_exists(enemy)){
	a.direction = point_direction(a.x,a.y,enemy.x,enemy.y);
}
a.image_angle = a.direction - 90
a.speed = 20
a.track_inst = enemy
a.damage = damage

a = MakePlayerBullet(x+35*scale_x,y,bullet_player_splitter,seq_splitter_a_intro)
a.direction = 90
enemy = find_priority_enemy(bullet_player_splitter)
if(instance_exists(enemy)){
	a.direction = point_direction(a.x,a.y,enemy.x,enemy.y);
}
a.image_angle = a.direction - 90
a.speed = 20
a.track_inst = enemy
a.damage = damage