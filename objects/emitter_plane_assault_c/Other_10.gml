live;
switch(weapon_level){
	case 0:
		a = instance_create_depth(x,y,depth,bullet_player_plane_assault_c_0);
		a.scale_x = scale_x;
		a.scale_y = scale_y;
		a.image_index = l1b;
		l1b = !l1b;
		break;
		
	case 1:
		a = instance_create_depth(x,y-20*scale_y,depth,bullet_player_plane_assault_c_1);
		a.scale_x = scale_x;
		a.scale_y = scale_y;
		a.image_index = l1b;
		l1b = !l1b;
		break;
		
	case 2:
		a = instance_create_depth(x,y-30*scale_y,depth,bullet_player_plane_assault_c_2);
		a.scale_x = scale_x;
		a.scale_y = scale_y;
		a.image_index = l1b;
		l1b = !l1b;
		break;
		
	case 3:
		a = instance_create_depth(x,y-40*scale_y,depth,bullet_player_plane_assault_c_3);
		a.scale_x = scale_x;
		a.scale_y = scale_y;
		a.image_index = l1b;
		l1b = !l1b;
		break;
}
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
fire.scale_x = scale_x;
fire.scale_y = scale_y;