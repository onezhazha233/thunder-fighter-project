live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		hspd = 1;
		blt = MakePlayerBullet(x,y,bullet_player_wingman_railcannon);
		blt.sprite_index = spr_bullet_player_railcannon_a;
		blt.rampage = true;
		if(dir = 0){
			blt.image_angle += 7+10*bb;
			blt.x += 6*bb;
		}
		else{
			blt.image_angle -= 7+10*bb;
			blt.x -= 6*bb;
		}
		blt.direction = blt.image_angle + 90;
		blt.speed = 45;
		blt.damage = damage;
		bb += 1;
	}
}
else{
	time = 0;
}