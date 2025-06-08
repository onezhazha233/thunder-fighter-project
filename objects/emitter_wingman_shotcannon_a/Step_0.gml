live;
event_inherited();

if(alarm[1] = -1)rtime = 0;

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		hspd = 0.8;
		damage = 0.271;
		switch(weapon_level){
			case 0:damage = 0.271;break;
			case 1:damage = 0.325;break;
			case 2:damage = 0.39;break;
			case 3:damage = 0.417;break;
		}
		a = MakePlayerBullet(x,y-50,bullet_player_wingman_shotcannon);
		a.sprite_index = spr_bullet_player_shotcannon_abc;
		a.hspeed = -hspd;
		a.image_angle = 2;
		a.damage = damage;
		a = MakePlayerBullet(x,y-50,bullet_player_wingman_shotcannon);
		a.sprite_index = spr_bullet_player_shotcannon_abc;
		a.hspeed = hspd;
		a.image_angle = -2;
		a.damage = damage;
	}
}
else{
	time = 0;
}