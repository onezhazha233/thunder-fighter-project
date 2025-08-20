live;
damage = 3.75/5*3
switch(weapon_level){
	case 0:damage = 3.75/5*3*global.atk_subweapon;break;
	case 1:damage = 4.3875/5*3*global.atk_subweapon;break;
	case 2:damage = 5.1/5*3*global.atk_subweapon;break;
	case 3:damage = 5.25/5*3*global.atk_subweapon;break;
}

angle = -90
for(i=0;i<5;i+=1){
	a = MakePlayerBullet(x,y,bullet_player_lightning,seq_lightning_cd);
	layer_sequence_angle(a.bullet_sequence,angle-90);
	a.collision_effect_sequence = seq_lightning_cd_explosion;
	a.dir = angle;
	a.direction = angle;
	a.image_angle = angle - 90;
	a.track_inst = find_priority_enemy(bullet_player_lightning);
	a.damage = damage;
	angle += 72;
}