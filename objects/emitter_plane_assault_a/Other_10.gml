live;
switch(weapon_level){
	case 0:
		if(l1b = 0){
			MakePlayerBullet(x,y,bullet_player_plane_assault_a_0).damage = damage;
		}
		else{
			MakePlayerBullet(x,y,bullet_player_plane_assault_a_1).damage = damage;
		}
		l1b = !l1b;
		break;
		
	case 1:
		if(l1b = 0){
			MakePlayerBullet(x,y,bullet_player_plane_assault_a_3).damage = damage;
		}
		else{
			MakePlayerBullet(x,y,bullet_player_plane_assault_a_2).damage = damage;
		}
		l1b = !l1b;
		break;
		
	case 2:
		MakePlayerBullet(x,y,bullet_player_plane_assault_a_4).damage = damage;
		break;
		
	case 3:
		MakePlayerBullet(x,y,bullet_player_plane_assault_a_5).damage = damage;
		break;
}
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
fire.scale_x = scale_x;
fire.scale_y = scale_y;
follow_inst = [fire]