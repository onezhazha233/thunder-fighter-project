live;
if(bb mod 4 = 3){
	blt = MakePlayerBullet(x-12*scale_x,y,bullet_player_plane_raptor,seq_bullet_player_raptor_d);
	blt.sprite_index = spr_bullet_player_raptor_d;
	blt.vspeed = -17;
	blt.damage = damage;
	blt = MakePlayerBullet(x+12*scale_x,y,bullet_player_plane_raptor,seq_bullet_player_raptor_d);
	blt.sprite_index = spr_bullet_player_raptor_d;
	blt.vspeed = -17;
	blt.damage = damage;
}
if(weapon_level > 0&&bb mod 4 = 2){
	blt = MakePlayerBullet(x-22*scale_x,y+15*scale_y,bullet_player_plane_raptor,seq_bullet_player_raptor_d);
	blt.sprite_index = spr_bullet_player_raptor_d;
	blt.vspeed = -22.5;
	blt.damage = damage;
	blt = MakePlayerBullet(x+22*scale_x,y+15*scale_y,bullet_player_plane_raptor,seq_bullet_player_raptor_d);
	blt.sprite_index = spr_bullet_player_raptor_d;
	blt.vspeed = -22.5;
	blt.damage = damage;
}
if(weapon_level > 1&&bb mod 4 = 1){
	blt = MakePlayerBullet(x-34*scale_x,y+30*scale_y,bullet_player_plane_raptor,seq_bullet_player_raptor_d);
	blt.sprite_index = spr_bullet_player_raptor_d;
	blt.vspeed = -28;
	blt.damage = damage;
	blt = MakePlayerBullet(x+34*scale_x,y+30*scale_y,bullet_player_plane_raptor,seq_bullet_player_raptor_d);
	blt.sprite_index = spr_bullet_player_raptor_d;
	blt.vspeed = -28;
	blt.damage = damage;
}
if(weapon_level > 2&&bb mod 4 = 0){
	blt = MakePlayerBullet(x-45*scale_x,y+45*scale_y,bullet_player_plane_raptor,seq_bullet_player_raptor_d);
	blt.sprite_index = spr_bullet_player_raptor_d;
	blt.vspeed = -33.5;
	blt.damage = damage;
	blt = MakePlayerBullet(x+45*scale_x,y+45*scale_y,bullet_player_plane_raptor,seq_bullet_player_raptor_d);
	blt.sprite_index = spr_bullet_player_raptor_d;
	blt.vspeed = -33.5;
	blt.damage = damage;
	
	fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_raptor_fire);
	fire.scale_x = scale_x;
	fire.scale_y = scale_y;
	follow_inst = [fire];
	audio_play_sound(snd_plane_shoot,0,0);
}

bb += 1