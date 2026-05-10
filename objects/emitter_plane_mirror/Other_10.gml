live;
switch(weapon_level){
	case 0:
		//if(l1b = 0){
			lblt = MakePlayerBullet(x,y,bullet_player_plane_mirror);
			lblt.image_index = 0;
			lblt.direction = 135;
			lblt.image_angle = 45;
			lblt.speed = 22.5;
			lblt.damage = damage;
			rblt = MakePlayerBullet(room_width-x,y,bullet_player_plane_mirror);
			rblt.image_index = 1;
			rblt.direction = 45;
			rblt.image_angle = -45;
			rblt.speed = 22.5;
			rblt.damage = damage;
			
			lblt = MakePlayerBullet(x,y,bullet_player_plane_mirror);
			lblt.image_index = 1;
			lblt.direction = 45;
			lblt.image_angle = -45;
			lblt.speed = 22.5;
			lblt.damage = damage;
			rblt = MakePlayerBullet(room_width-x,y,bullet_player_plane_mirror);
			rblt.image_index = 0;
			rblt.direction = 135;
			rblt.image_angle = 45;
			rblt.speed = 22.5;
			rblt.damage = damage;
		//}
		//else{
			//MakePlayerBullet(x,y,bullet_player_plane_assault_a_1).damage = damage;
			//MakePlayerBullet(room_width-x,y,bullet_player_plane_assault_a_1).damage = damage;
		//}
		//l1b = !l1b;
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