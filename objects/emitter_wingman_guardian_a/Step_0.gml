live;
event_inherited();

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	damage = 0.46875;
	if(time > 0){
		if(rampage = false){
			damage = 1.9375;
			switch(weapon_level){
				case 0:damage = 1.9375;break;
				case 1:damage = 1.259375;break;
				case 2:damage = 1.097917;break;
				case 3:damage = 0.96875;break;
			}
			if(bb <= weapon_level){
				if(dir = 0){
					a = MakePlayerBullet(x,y,bullet_player_wingman_guardian);
					a.image_angle = -bb*10;
					a.direction = 90 - bb*10;
				}
				else{
					a = MakePlayerBullet(x,y,bullet_player_wingman_guardian);
					a.image_angle = bb*10;
					a.direction = 90 + bb*10;
				}
				a.damage = damage;
			}
		}
		else{
			damage = 2;
			if(dir = 0){
				a = MakePlayerBullet(x,y,bullet_player_wingman_guardian_rampage);
				a.image_angle = -bb*10;
				a.direction = 90 - bb*10;
			}
			else{
				a = MakePlayerBullet(x,y,bullet_player_wingman_guardian_rampage);
				a.image_angle = bb*10;
				a.direction = 90 + bb*10;
			}
			a.damage = damage;
		}
		bb += 1;
	}
}
else{
	time = 0;
}