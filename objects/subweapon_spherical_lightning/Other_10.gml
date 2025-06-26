live;
damage = 3.75/4*3
switch(weapon_level){
	case 0:damage = 3.75/4*3;break;
	case 1:damage = 4.3875/4*3;break;
	case 2:damage = 5.1/4*3;break;
	case 3:damage = 5.25/4*3;break;
}

angle = 0
for(i=0;i<4;i+=1){
	a = MakePlayerBullet(x,y,bullet_player_lightning,seq_lightning_b);
	layer_sequence_angle(a.bullet_sequence,angle-90);
	a.collision_effect_sequence = seq_bullet_effect_lightning_b;
	a.dir = angle;
	a.direction = angle;
	a.image_angle = angle - 90;
	a.track_inst = find_priority_enemy(bullet_player_lightning);
	a.damage = damage;
	angle += 90;
}