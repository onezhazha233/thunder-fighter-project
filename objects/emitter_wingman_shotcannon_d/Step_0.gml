live;
event_inherited();

if(alarm[1] = -1)rtime = 0;

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		hspd = 1.5;
		damage = 0.271/5*2;
		switch(weapon_level){
			case 0:damage = 0.271/5*2;break;
			case 1:damage = 0.325/5*2;break;
			case 2:damage = 0.39/5*2;break;
			case 3:damage = 0.417/5*2;break;
		}
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