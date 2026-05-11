live;
switch(weapon_level){
	case 0:
		case 0:
		if(l1b = 0){
			MakePlayerBullet(x,y,bullet_player_plane_assault_a_0).damage = damage;
			MakePlayerBullet(room_width-x,y,bullet_player_plane_assault_a_0).damage = damage;
		}
		else{
			MakePlayerBullet(x,y,bullet_player_plane_assault_a_1).damage = damage;
			MakePlayerBullet(room_width-x,y,bullet_player_plane_assault_a_1).damage = damage;
		}
		l1b = !l1b;
		break;
		
	case 1:
		if(l1b = 0){
			MakePlayerBullet(x,y,bullet_player_plane_assault_a_3).damage = damage;
			MakePlayerBullet(room_width-x,y,bullet_player_plane_assault_a_3).damage = damage;
		}
		else{
			MakePlayerBullet(x,y,bullet_player_plane_assault_a_2).damage = damage;
			MakePlayerBullet(room_width-x,y,bullet_player_plane_assault_a_2).damage = damage;
		}
		l1b = !l1b;
		break;
		
	case 2:
		MakePlayerBullet(x,y,bullet_player_plane_assault_a_4).damage = damage;
		MakePlayerBullet(room_width-x,y,bullet_player_plane_assault_a_4).damage = damage;
		break;
		
	case 3:
		MakePlayerBullet(x,y,bullet_player_plane_assault_a_5).damage = damage;
		MakePlayerBullet(room_width-x,y,bullet_player_plane_assault_a_5).damage = damage;
		break;
}