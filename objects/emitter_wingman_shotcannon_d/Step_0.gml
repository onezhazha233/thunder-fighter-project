live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		hspd = 1.5;
		a = MakePlayerBullet(x,y-30,bullet_player_wingman_shotcannon);
		a.sprite_index = spr_bullet_player_shotcannon_d;
		a.hspeed = -hspd*2;
		a.image_angle = 8;
		a.damage = damage;
		a = MakePlayerBullet(x,y-30,bullet_player_wingman_shotcannon);
		a.sprite_index = spr_bullet_player_shotcannon_d;
		a.hspeed = -hspd;
		a.image_angle = 4;
		a.damage = damage;
		a = MakePlayerBullet(x,y-30,bullet_player_wingman_shotcannon);
		a.sprite_index = spr_bullet_player_shotcannon_d;
		a.damage = damage;
		a = MakePlayerBullet(x,y-30,bullet_player_wingman_shotcannon);
		a.sprite_index = spr_bullet_player_shotcannon_d;
		a.hspeed = hspd;
		a.image_angle = -4;
		a.damage = damage;
		a = MakePlayerBullet(x,y-30,bullet_player_wingman_shotcannon);
		a.sprite_index = spr_bullet_player_shotcannon_d;
		a.hspeed = hspd*2;
		a.image_angle = -8;
		a.damage = damage;
	}
}
else{
	time = 0;
}