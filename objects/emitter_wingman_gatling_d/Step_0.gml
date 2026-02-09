live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 3 = 1){
		hspd = 1;
		blt = MakePlayerBullet(x,y,bullet_player_wingman_gatling);
		blt.sprite_index = spr_bullet_player_gatling_d;
		if(dir = 0){
			blt.hspeed = hspd*bb;
			blt.image_angle = -2*bb;
		}
		else{
			blt.hspeed = -hspd*bb;
			blt.image_angle = 2*bb;
		}
		blt.damage = damage;
		bb += 1;
		r = 0;
	}
}
else{
	time = 0;
}