live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		hspd = 1.4;
		damage = 0.271/3*2;
		a = MakePlayerBullet(x,y-50,bullet_player_wingman_shotcannon);
		a.sprite_index = spr_bullet_player_shotcannon_abc;
		a.hspeed = -hspd;
		a.image_angle = 4;
		a.damage = damage;
		a = MakePlayerBullet(x,y-50,bullet_player_wingman_shotcannon);
		a.sprite_index = spr_bullet_player_shotcannon_abc;
		a.damage = damage;
		a = MakePlayerBullet(x,y-50,bullet_player_wingman_shotcannon);
		a.sprite_index = spr_bullet_player_shotcannon_abc;
		a.hspeed = hspd;
		a.image_angle = -4;
		a.damage = damage;
	}
}
else{
	time = 0;
}