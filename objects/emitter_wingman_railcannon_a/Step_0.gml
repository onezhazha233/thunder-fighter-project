live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		hspd = 1;
		damage = 0.46875;
		switch(weapon_level){
			case 0:damage = 0.46875;break;
			case 1:damage = 0.528125;break;
			case 2:damage = 0.584375;break;
			case 3:damage = 0.5625;break;
		}
		a = MakePlayerBullet(x,y,bullet_player_wingman_railcannon)
		a.sprite_index = spr_bullet_player_railcannon_a;
		a.rampage = true;
		if(dir = 0){
			a.image_angle += 7+10*bb;
			a.x += 6*bb;
		}
		else{
			a.image_angle -= 7+10*bb;
			a.x -= 6*bb;
		}
		a.direction = a.image_angle + 90;
		a.speed = 45;
		a.damage = damage;
		bb += 1;
	}
}
else{
	time = 0;
}