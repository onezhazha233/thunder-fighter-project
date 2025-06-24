live;
damage = 5
switch(weapon_level){
	case 0:damage = 5;break;
	case 1:damage = 5.85;break;
	case 2:damage = 6.5875;break;
	case 3:damage = 6.5;break;
}

angle = 45
a = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_intro)
layer_sequence_angle(a.bullet_sequence,angle-90);
a.direction = angle
a.image_angle = angle - 90
a.track_inst = find_priority_enemy(bullet_player_missile)
a.damage = damage

angle = 135
a = MakePlayerBullet(x,y+60*scale_y,bullet_player_missile,seq_missile_ab_intro)
layer_sequence_angle(a.bullet_sequence,angle-90);
a.direction = angle
a.image_angle = angle - 90
a.track_inst = find_priority_enemy(bullet_player_missile)
a.damage = damage