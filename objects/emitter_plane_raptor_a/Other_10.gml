live;
a = instance_create_depth(x-12,y,depth,bullet_player_plane_raptor_a);
a.vspeed = -17;
a.scale_x = scale_x;
a.scale_y = scale_y;
a = instance_create_depth(x+12,y,depth,bullet_player_plane_raptor_a);
a.vspeed = -17;
a.scale_x = scale_x;
a.scale_y = scale_y;
if(weapon_level > 0){
	a = instance_create_depth(x-22,y+15,depth,bullet_player_plane_raptor_a);
	a.vspeed = -22.5;
	a.scale_x = scale_x;
	a.scale_y = scale_y;
	a = instance_create_depth(x+22,y+15,depth,bullet_player_plane_raptor_a);
	a.vspeed = -22.5;
	a.scale_x = scale_x;
	a.scale_y = scale_y;
}
if(weapon_level > 1){
	a = instance_create_depth(x-34,y+30,depth,bullet_player_plane_raptor_a);
	a.vspeed = -28;
	a.scale_x = scale_x;
	a.scale_y = scale_y;
	a = instance_create_depth(x+34,y+30,depth,bullet_player_plane_raptor_a);
	a.vspeed = -28;
	a.scale_x = scale_x;
	a.scale_y = scale_y;
}
if(weapon_level > 2){
	a = instance_create_depth(x-45,y+45,depth,bullet_player_plane_raptor_a);
	a.vspeed = -33.5;
	a.scale_x = scale_x;
	a.scale_y = scale_y;
	a = instance_create_depth(x+45,y+45,depth,bullet_player_plane_raptor_a);
	a.vspeed = -33.5;
	a.scale_x = scale_x;
	a.scale_y = scale_y;
}
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_raptor_fire);
fire.scale_x = scale_x;
fire.scale_y = scale_y;