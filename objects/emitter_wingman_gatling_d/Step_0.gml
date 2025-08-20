live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 3 = 1){
		hspd = 1;
		damage = 0.3;
		switch(weapon_level){
			case 0:damage = 0.3*global.atk_wingman;break;
			case 1:damage = 0.3575*global.atk_wingman;break;
			case 2:damage = 0.425*global.atk_wingman;break;
			case 3:damage = 0.45*global.atk_wingman;break;
		}
		a = MakePlayerBullet(x,y,bullet_player_wingman_gatling);
		a.sprite_index = spr_bullet_player_gatling_d;
		if(dir = 0){
			a.hspeed = hspd*bb;
			a.image_angle = -2*bb;
		}
		else{
			a.hspeed = -hspd*bb;
			a.image_angle = 2*bb;
		}
		a.damage = damage;
		bb += 1;
		r = 0;
	}
}
else{
	time = 0;
}