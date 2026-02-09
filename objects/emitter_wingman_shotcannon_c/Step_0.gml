live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		hspd = 0.8;
		blt = MakePlayerBullet(x,y-40,bullet_player_wingman_shotcannon);
		blt.sprite_index = spr_bullet_player_shotcannon_abc;
		blt.hspeed = -hspd*3;
		blt.image_angle = 6;
		blt.damage = damage;
		blt = MakePlayerBullet(x,y-40,bullet_player_wingman_shotcannon);
		blt.sprite_index = spr_bullet_player_shotcannon_abc;
		blt.hspeed = -hspd;
		blt.image_angle = 2;
		blt.damage = damage;
		blt = MakePlayerBullet(x,y-40,bullet_player_wingman_shotcannon);
		blt.sprite_index = spr_bullet_player_shotcannon_abc;
		blt.hspeed = hspd;
		blt.image_angle = -2;
		blt.damage = damage;
		blt = MakePlayerBullet(x,y-40,bullet_player_wingman_shotcannon);
		blt.sprite_index = spr_bullet_player_shotcannon_abc;
		blt.hspeed = hspd*3;
		blt.image_angle = -6;
		blt.damage = damage;
	}
}
else{
	time = 0;
}