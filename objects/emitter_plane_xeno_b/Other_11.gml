live;
damage = 0.125*global.atk_plane

if(bb mod 4 = 3){
	a = MakePlayerBullet(x-12*scale_x,y,bullet_player_plane_xeno,seq_bullet_player_xeno_b_rampage);
	a.sprite_index = spr_bullet_player_xeno_b;
	a.vspeed = -32.5*2;
	a.rampage = true;
	a.damage_interval -= 3;
	a.damage = damage;
	a = MakePlayerBullet(x+12*scale_x,y,bullet_player_plane_xeno,seq_bullet_player_xeno_b_rampage);
	a.sprite_index = spr_bullet_player_xeno_b;
	a.vspeed = -32.5*2;
	a.rampage = true;
	a.damage_interval -= 3;
	a.damage = damage;
}
if(bb mod 4 = 2){
	a = MakePlayerBullet(x-22*scale_x,y+15*scale_y,bullet_player_plane_xeno,seq_bullet_player_xeno_b_rampage);
	a.sprite_index = spr_bullet_player_xeno_b;
	a.vspeed = -27*2;
	a.rampage = true;
	a.damage_interval -= 2;
	a.damage = damage;
	a = MakePlayerBullet(x+22*scale_x,y+15*scale_y,bullet_player_plane_xeno,seq_bullet_player_xeno_b_rampage);
	a.sprite_index = spr_bullet_player_xeno_b;
	a.vspeed = -27*2;
	a.rampage = true;
	a.damage_interval -= 2;
	a.damage = damage;
}
if(bb mod 4 = 1){
	a = MakePlayerBullet(x-34*scale_x,y+30*scale_y,bullet_player_plane_xeno,seq_bullet_player_xeno_b_rampage);
	a.sprite_index = spr_bullet_player_xeno_b;
	a.vspeed = -21.5*2;
	a.rampage = true;
	a.damage_interval -= 1;
	a.damage = damage;
	a = MakePlayerBullet(x+34*scale_x,y+30*scale_y,bullet_player_plane_xeno,seq_bullet_player_xeno_b_rampage);
	a.sprite_index = spr_bullet_player_xeno_b;
	a.vspeed = -21.5*2;
	a.rampage = true;
	a.damage_interval -= 1;
	a.damage = damage;
}
if(bb mod 4 = 0){
	a = MakePlayerBullet(x-45*scale_x,y+45*scale_y,bullet_player_plane_xeno,seq_bullet_player_xeno_b_rampage);
	a.sprite_index = spr_bullet_player_xeno_b;
	a.vspeed = -16*2;
	a.rampage = true;
	a.damage = damage;
	a = MakePlayerBullet(x+45*scale_x,y+45*scale_y,bullet_player_plane_xeno,seq_bullet_player_xeno_b_rampage);
	a.sprite_index = spr_bullet_player_xeno_b;
	a.vspeed = -16*2;
	a.rampage = true;
	a.damage = damage;
	
	fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_xeno_fire);
	fire.image_index = 1;
	fire.scale_x = scale_x;
	fire.scale_y = scale_y;
	follow_inst = [fire];
}

bb += 1