live
if(bb mod 4 = 3){
	a = MakePlayerBullet(x-12*scale_x,y,bullet_player_plane_raptor,seq_bullet_player_raptor_d_rampage);
	a.sprite_index = spr_bullet_player_raptor_d;
	a.vspeed = -16*2;
	a.rampage = true;
	a.damage = damage;
	a = MakePlayerBullet(x+12*scale_x,y,bullet_player_plane_raptor,seq_bullet_player_raptor_d_rampage);
	a.sprite_index = spr_bullet_player_raptor_d;
	a.vspeed = -16*2;
	a.rampage = true;
	a.damage = damage;
}
if(bb mod 4 = 2){
	a = MakePlayerBullet(x-22*scale_x,y+15*scale_y,bullet_player_plane_raptor,seq_bullet_player_raptor_d_rampage);
	a.sprite_index = spr_bullet_player_raptor_d;
	a.vspeed = -21.5*2;
	a.rampage = true;
	a.damage = damage;
	a = MakePlayerBullet(x+22*scale_x,y+15*scale_y,bullet_player_plane_raptor,seq_bullet_player_raptor_d_rampage);
	a.sprite_index = spr_bullet_player_raptor_d;
	a.vspeed = -21.5*2;
	a.rampage = true;
	a.damage = damage;
}
if(bb mod 4 = 1){
	a = MakePlayerBullet(x-34*scale_x,y+30*scale_y,bullet_player_plane_raptor,seq_bullet_player_raptor_d_rampage);
	a.sprite_index = spr_bullet_player_raptor_d;
	a.vspeed = -27*2;
	a.rampage = true;
	a.damage = damage;
	a = MakePlayerBullet(x+34*scale_x,y+30*scale_y,bullet_player_plane_raptor,seq_bullet_player_raptor_d_rampage);
	a.sprite_index = spr_bullet_player_raptor_d;
	a.vspeed = -27*2;
	a.rampage = true;
	a.damage = damage;
}
if(bb mod 4 = 0){
	a = MakePlayerBullet(x-45*scale_x,y+45*scale_y,bullet_player_plane_raptor,seq_bullet_player_raptor_d_rampage);
	a.sprite_index = spr_bullet_player_raptor_d;
	a.vspeed = -32.5*2;
	a.rampage = true;
	a.damage = damage;
	a = MakePlayerBullet(x+45*scale_x,y+45*scale_y,bullet_player_plane_raptor,seq_bullet_player_raptor_d_rampage);
	a.sprite_index = spr_bullet_player_raptor_d;
	a.vspeed = -32.5*2;
	a.rampage = true;
	a.damage = damage;
	
	fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_raptor_fire);
	fire.image_index = 1;
	fire.scale_x = scale_x;
	fire.scale_y = scale_y;
	follow_inst = [fire];
	audio_play_sound(snd_plane_shoot,0,0);
}

bb += 1