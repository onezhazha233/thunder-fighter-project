live;
a = MakePlayerBullet(x-35*scale_x,y,bullet_player_splitter,seq_splitter_b_intro)
a.idle = seq_splitter_b
a.small_sequence = seq_splitter_b_small
a.collision_effect_sequence = seq_bullet_effect_dawn_b
a.direction = 90
enemy = find_priority_enemy(bullet_player_splitter)
if(instance_exists(enemy)){
	a.direction = point_direction(a.x,a.y,enemy.x,enemy.y);
}
a.image_angle = a.direction - 90
a.speed = 20
a.track_inst = enemy
a.damage = damage

a = MakePlayerBullet(x+35*scale_x,y,bullet_player_splitter,seq_splitter_b_intro)
a.idle = seq_splitter_b
a.small_sequence = seq_splitter_b_small
a.collision_effect_sequence = seq_bullet_effect_dawn_b
a.direction = 90
enemy = find_priority_enemy(bullet_player_splitter)
if(instance_exists(enemy)){
	a.direction = point_direction(a.x,a.y,enemy.x,enemy.y);
}
a.image_angle = a.direction - 90
a.speed = 20
a.track_inst = enemy
a.damage = damage