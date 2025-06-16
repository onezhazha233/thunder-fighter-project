live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		hspd = 0.8;
		damage = 0.271/2;
		switch(weapon_level){
			case 0:damage = 0.271/2;break;
			case 1:damage = 0.325/2;break;
			case 2:damage = 0.39/2;break;
			case 3:damage = 0.417/2;break;
		}
		a = MakePlayerBullet(x,y-40,bullet_player_wingman_shotcannon);
		a.sprite_index = spr_bullet_player_shotcannon_abc;
		a.hspeed = -hspd*3;
		a.image_angle = 6;
		a.damage = damage;
		a = MakePlayerBullet(x,y-40,bullet_player_wingman_shotcannon);
		a.sprite_index = spr_bullet_player_shotcannon_abc;
		a.hspeed = -hspd;
		a.image_angle = 2;
		a.damage = damage;
		a = MakePlayerBullet(x,y-40,bullet_player_wingman_shotcannon);
		a.sprite_index = spr_bullet_player_shotcannon_abc;
		a.hspeed = hspd;
		a.image_angle = -2;
		a.damage = damage;
		a = MakePlayerBullet(x,y-40,bullet_player_wingman_shotcannon);
		a.sprite_index = spr_bullet_player_shotcannon_abc;
		a.hspeed = hspd*3;
		a.image_angle = -6;
		a.damage = damage;
	}
}
else{
	time = 0;
}