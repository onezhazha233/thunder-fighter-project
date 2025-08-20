live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		hspd = 1.4;
		damage = 0.271/3*2;
		switch(weapon_level){
			case 0:damage = 0.271/3*2*global.atk_wingman;break;
			case 1:damage = 0.325/3*2*global.atk_wingman;break;
			case 2:damage = 0.39/3*2*global.atk_wingman;break;
			case 3:damage = 0.417/3*2*global.atk_wingman;break;
		}
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