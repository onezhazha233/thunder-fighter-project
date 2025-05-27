live;
MakePlayerBullet(x-45*scale_x,y+45*scale_y,bullet_player_plane_xeno_c,seq_bullet_player_xeno_c).vspeed = -17
MakePlayerBullet(x+45*scale_x,y+45*scale_y,bullet_player_plane_xeno_c,seq_bullet_player_xeno_c).vspeed = -17
if(weapon_level > 0){
	a = MakePlayerBullet(x-34*scale_x,y+30*scale_y,bullet_player_plane_xeno_c,seq_bullet_player_xeno_c);
	a.vspeed = -22.5;
	a.damage_interval -= 1;
	a = MakePlayerBullet(x+34*scale_x,y+30*scale_y,bullet_player_plane_xeno_c,seq_bullet_player_xeno_c);
	a.vspeed = -22.5;
	a.damage_interval -= 1;
}
if(weapon_level > 1){
	a = MakePlayerBullet(x-22*scale_x,y+15*scale_y,bullet_player_plane_xeno_c,seq_bullet_player_xeno_c);
	a.vspeed = -28;
	a.damage_interval -= 2;
	a = MakePlayerBullet(x+22*scale_x,y+15*scale_y,bullet_player_plane_xeno_c,seq_bullet_player_xeno_c);
	a.vspeed = -28;
	a.damage_interval -= 2;
}
if(weapon_level > 2){
	a = MakePlayerBullet(x-12*scale_x,y,bullet_player_plane_xeno_c,seq_bullet_player_xeno_c);
	a.vspeed = -33.5;
	a.damage_interval -= 3;
	a = MakePlayerBullet(x+12*scale_x,y,bullet_player_plane_xeno_c,seq_bullet_player_xeno_c);
	a.vspeed = -33.5;
	a.damage_interval -= 3;
}
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_xeno_fire);
fire.scale_x = scale_x;
fire.scale_y = scale_y;
follow_inst = [fire]