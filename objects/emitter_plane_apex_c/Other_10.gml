live;
switch(weapon_level){
	case 0:
		a = instance_create_depth(x,y,depth,bullet_player_plane_apex_c_0);
		a.scale_x = scale_x;
		a.scale_y = scale_y;
		break;
		
	case 1:
		a = instance_create_depth(x,y,depth,bullet_player_plane_apex_c_1);
		a.scale_x = scale_x;
		a.scale_y = scale_y;
		break;
		
	case 2:
		a = instance_create_depth(x,y,depth,bullet_player_plane_apex_c_2);
		a.scale_x = scale_x;
		a.scale_y = scale_y;
		break;
		
	case 3:
		a = instance_create_depth(x,y,depth,bullet_player_plane_apex_c_3);
		a.scale_x = scale_x;
		a.scale_y = scale_y;
		break;
}
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_apex_fire);
fire.sprite_index = spr_bullet_player_apex_abc_fire
fire.scale_x = scale_x;
fire.scale_y = scale_y;
fire.y_offset = 5