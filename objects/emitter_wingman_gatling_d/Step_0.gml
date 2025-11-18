live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 3 = 1){
		hspd = 1;
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