live;
switch(weapon_level){
	case 0:
		if(l1b = 0){
			a = instance_create_depth(x,y,depth,bullet_player_plane_assault_b_0);
			a.scale_x = scale_x;
			a.scale_y = scale_y;
		}
		else{
			a = instance_create_depth(x,y,depth,bullet_player_plane_assault_b_1);
			a.scale_x = scale_x;
			a.scale_y = scale_y;
		}
		l1b = !l1b;
		break;
		
	case 1:
		a = instance_create_depth(x,y,depth,bullet_player_plane_assault_b_2);
		a.scale_x = scale_x;
		a.scale_y = scale_y;
		break;
		
	case 2:
		a = instance_create_depth(x,y,depth,bullet_player_plane_assault_b_3);
		a.scale_x = scale_x;
		a.scale_y = scale_y;
		break;
		
	case 3:
		a = instance_create_depth(x,y,depth,bullet_player_plane_assault_b_4);
		a.scale_x = scale_x;
		a.scale_y = scale_y;
		break;
}
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
fire.scale_x = scale_x;
fire.scale_y = scale_y;