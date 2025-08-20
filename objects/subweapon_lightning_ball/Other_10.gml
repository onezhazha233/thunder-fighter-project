live;
damage = 3.75
switch(weapon_level){
	case 0:damage = 3.75*global.atk_subweapon;break;
	case 1:damage = 4.3875*global.atk_subweapon;break;
	case 2:damage = 5.1*global.atk_subweapon;break;
	case 3:damage = 5.25*global.atk_subweapon;break;
}

angle = -90
for(i=0;i<3;i+=1){
	a = MakePlayerBullet(x,y,bullet_player_lightning,seq_lightning_a)
	layer_sequence_angle(a.bullet_sequence,angle-90);
	a.dir = angle;
	a.direction = angle;
	a.image_angle = angle - 90;
	a.track_inst = find_priority_enemy(bullet_player_lightning);
	a.damage = damage;
	angle += 120;
}