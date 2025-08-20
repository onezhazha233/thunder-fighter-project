live;
switch(weapon_level){
	case 0:
		bullet = MakePlayerBullet(x,y,bullet_player_plane_assault_d_0);
		bullet.image_index = l1b;
		bullet.damage = damage;
		l1b = !l1b;
		break;
		
	case 1:
		bullet = MakePlayerBullet(x,y-40*scale_y,bullet_player_plane_assault_d_1);
		bullet.image_index = l1b;
		bullet.damage = damage;
		l1b = !l1b;
		break;
		
	case 2:
		bullet = MakePlayerBullet(x,y-50*scale_y,bullet_player_plane_assault_d_2);
		bullet.image_index = l1b;
		bullet.damage = damage;
		l1b = !l1b;
		break;
		
	case 3:
		bullet = MakePlayerBullet(x,y-60*scale_y,bullet_player_plane_assault_d_3);
		bullet.image_index = l1b;
		bullet.damage = damage;
		l1b = !l1b;
		break;
}
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
fire.sprite_index = spr_bullet_player_assault_d_fire
fire.scale_x = scale_x;
fire.scale_y = scale_y;
fire.y_offset = -20
follow_inst = [fire]