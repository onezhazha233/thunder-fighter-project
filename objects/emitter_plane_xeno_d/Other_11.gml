live;
if(bb mod 4 = 3){
	blt = MakePlayerBullet(x-12*scale_x,y,bullet_player_plane_xeno,seq_bullet_player_xeno_d_rampage);
	blt.sprite_index = spr_bullet_player_xeno_d;
	blt.vspeed = -32.5*2;
	blt.rampage = true;
	blt.damage_interval -= 3;
	blt.damage = damage;
	blt = MakePlayerBullet(x+12*scale_x,y,bullet_player_plane_xeno,seq_bullet_player_xeno_d_rampage);
	blt.sprite_index = spr_bullet_player_xeno_d;
	blt.vspeed = -32.5*2;
	blt.rampage = true;
	blt.damage_interval -= 3;
	blt.damage = damage;
}
if(bb mod 4 = 2){
	blt = MakePlayerBullet(x-22*scale_x,y+15*scale_y,bullet_player_plane_xeno,seq_bullet_player_xeno_d_rampage);
	blt.sprite_index = spr_bullet_player_xeno_d;
	blt.vspeed = -27*2;
	blt.rampage = true;
	blt.damage_interval -= 2;
	blt.damage = damage;
	blt = MakePlayerBullet(x+22*scale_x,y+15*scale_y,bullet_player_plane_xeno,seq_bullet_player_xeno_d_rampage);
	blt.sprite_index = spr_bullet_player_xeno_d;
	blt.vspeed = -27*2;
	blt.rampage = true;
	blt.damage_interval -= 2;
	blt.damage = damage;
}
if(bb mod 4 = 1){
	blt = MakePlayerBullet(x-34*scale_x,y+30*scale_y,bullet_player_plane_xeno,seq_bullet_player_xeno_d_rampage);
	blt.sprite_index = spr_bullet_player_xeno_d;
	blt.vspeed = -21.5*2;
	blt.rampage = true;
	blt.damage_interval -= 1;
	blt.damage = damage;
	blt = MakePlayerBullet(x+34*scale_x,y+30*scale_y,bullet_player_plane_xeno,seq_bullet_player_xeno_d_rampage);
	blt.sprite_index = spr_bullet_player_xeno_d;
	blt.vspeed = -21.5*2;
	blt.rampage = true;
	blt.damage_interval -= 1;
	blt.damage = damage;
}
if(bb mod 4 = 0){
	blt = MakePlayerBullet(x-45*scale_x,y+45*scale_y,bullet_player_plane_xeno,seq_bullet_player_xeno_d_rampage);
	blt.sprite_index = spr_bullet_player_xeno_d;
	blt.vspeed = -16*2;
	blt.rampage = true;
	blt.damage = damage;
	blt = MakePlayerBullet(x+45*scale_x,y+45*scale_y,bullet_player_plane_xeno,seq_bullet_player_xeno_d_rampage);
	blt.sprite_index = spr_bullet_player_xeno_d;
	blt.vspeed = -16*2;
	blt.rampage = true;
	blt.damage = damage;
	
	fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_xeno_fire);
	fire.image_index = 1;
	fire.scale_x = scale_x;
	fire.scale_y = scale_y;
	follow_inst = [fire];
	audio_play_sound(snd_plane_shoot,0,0);
}

bb += 1