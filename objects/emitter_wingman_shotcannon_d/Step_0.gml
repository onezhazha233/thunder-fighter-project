live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		hspd = 1.5;
		blt = MakePlayerBullet(x,y-30,bullet_player_wingman_shotcannon);
		blt.sprite_index = spr_bullet_player_shotcannon_d;
		blt.hspeed = -hspd*2;
		blt.image_angle = 8;
		blt.damage = damage;
		blt = MakePlayerBullet(x,y-30,bullet_player_wingman_shotcannon);
		blt.sprite_index = spr_bullet_player_shotcannon_d;
		blt.hspeed = -hspd;
		blt.image_angle = 4;
		blt.damage = damage;
		blt = MakePlayerBullet(x,y-30,bullet_player_wingman_shotcannon);
		blt.sprite_index = spr_bullet_player_shotcannon_d;
		blt.damage = damage;
		blt = MakePlayerBullet(x,y-30,bullet_player_wingman_shotcannon);
		blt.sprite_index = spr_bullet_player_shotcannon_d;
		blt.hspeed = hspd;
		blt.image_angle = -4;
		blt.damage = damage;
		blt = MakePlayerBullet(x,y-30,bullet_player_wingman_shotcannon);
		blt.sprite_index = spr_bullet_player_shotcannon_d;
		blt.hspeed = hspd*2;
		blt.image_angle = -8;
		blt.damage = damage;
	}
}
else{
	time = 0;
}