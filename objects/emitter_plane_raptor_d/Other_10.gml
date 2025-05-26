live;
MakePlayerBullet(x-12*scale_x,y,bullet_player_plane_raptor_d,seq_bullet_player_raptor_d).vspeed = -17
MakePlayerBullet(x+12*scale_x,y,bullet_player_plane_raptor_d,seq_bullet_player_raptor_d).vspeed = -17
if(weapon_level > 0){
	MakePlayerBullet(x-22*scale_x,y+15*scale_y,bullet_player_plane_raptor_d,seq_bullet_player_raptor_d).vspeed = -22.5;
	MakePlayerBullet(x+22*scale_x,y+15*scale_y,bullet_player_plane_raptor_d,seq_bullet_player_raptor_d).vspeed = -22.5;
}
if(weapon_level > 1){
	MakePlayerBullet(x-34*scale_x,y+30*scale_y,bullet_player_plane_raptor_d,seq_bullet_player_raptor_d).vspeed = -28;
	MakePlayerBullet(x+34*scale_x,y+30*scale_y,bullet_player_plane_raptor_d,seq_bullet_player_raptor_d).vspeed = -28;
}
if(weapon_level > 2){
	MakePlayerBullet(x-45*scale_x,y+45*scale_y,bullet_player_plane_raptor_d,seq_bullet_player_raptor_d).vspeed = -33.5;
	MakePlayerBullet(x+45*scale_x,y+45*scale_y,bullet_player_plane_raptor_d,seq_bullet_player_raptor_d).vspeed = -33.5;
}
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_raptor_fire);
fire.scale_x = scale_x;
fire.scale_y = scale_y;
follow_inst = [fire]