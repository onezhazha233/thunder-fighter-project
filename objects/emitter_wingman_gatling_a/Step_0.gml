live;
event_inherited();

if(alarm[1] = -1)rtime = 0;

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 3 = 1){
		hspd = 1;
		damage = 0.46875;
		switch(weapon_level){
			case 0:damage = 0.46875;break;
			case 1:damage = 0.528125;break;
			case 2:damage = 0.584375;break;
			case 3:damage = 0.5625;break;
		}
		a = MakePlayerBullet(x,y,bullet_player_wingman_gatling);
		a.sprite_index = spr_bullet_player_gatling_abc;
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