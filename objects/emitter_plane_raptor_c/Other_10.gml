live;
damage = 0.5;
switch(weapon_level){
	case 0:damage = 0.5;break;
	case 1:damage = 0.325;break;
	case 2:damage = 0.284;break;
	case 3:damage = 0.25;break;
}

a = MakePlayerBullet(x-12*scale_x,y,bullet_player_plane_raptor_c,seq_bullet_player_raptor_c)
a.vspeed = -17
a.damage = damage
a = MakePlayerBullet(x+12*scale_x,y,bullet_player_plane_raptor_c,seq_bullet_player_raptor_c)
a.vspeed = -17
a.damage = damage
if(weapon_level > 0){
	a = MakePlayerBullet(x-22*scale_x,y+15*scale_y,bullet_player_plane_raptor_c,seq_bullet_player_raptor_c);
	a.vspeed = -22.5;
	a.damage = damage;
	a = MakePlayerBullet(x+22*scale_x,y+15*scale_y,bullet_player_plane_raptor_c,seq_bullet_player_raptor_c);
	a.vspeed = -22.5;
	a.damage = damage;
}
if(weapon_level > 1){
	a = MakePlayerBullet(x-34*scale_x,y+30*scale_y,bullet_player_plane_raptor_c,seq_bullet_player_raptor_c);
	a.vspeed = -28;
	a.damage = damage;
	a = MakePlayerBullet(x+34*scale_x,y+30*scale_y,bullet_player_plane_raptor_c,seq_bullet_player_raptor_c);
	a.vspeed = -28;
	a.damage = damage;
}
if(weapon_level > 2){
	a = MakePlayerBullet(x-45*scale_x,y+45*scale_y,bullet_player_plane_raptor_c,seq_bullet_player_raptor_c);
	a.vspeed = -33.5;
	a.damage = damage;
	a = MakePlayerBullet(x+45*scale_x,y+45*scale_y,bullet_player_plane_raptor_c,seq_bullet_player_raptor_c);
	a.vspeed = -33.5;
	a.damage = damage;
}
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_raptor_fire);
fire.scale_x = scale_x;
fire.scale_y = scale_y;
follow_inst = [fire]