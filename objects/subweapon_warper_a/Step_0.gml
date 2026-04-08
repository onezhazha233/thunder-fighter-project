live;
event_inherited();

if(enabled = true){
	if(time > 0)time -= 1;
	if(time mod 7 = 1){
		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 28;
		blt.speed = 15;
		blt.image_angle = blt.direction - 90;
		blt.damage = damage;

		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 180 - 28;
		blt.speed = 15;
		blt.image_angle = blt.direction - 90;
		blt.damage = damage;
		
		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 56;
		blt.speed = 15;
		blt.image_angle = blt.direction - 90;
		blt.damage = damage;

		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 180 - 56;
		blt.speed = 15;
		blt.image_angle = blt.direction - 90;
		blt.damage = damage;
	}
	if(rtime > 0)rtime -= 1;
	if(rtime mod 6 = 1){
		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 28;
		blt.speed = 25;
		blt.image_angle = blt.direction - 90;
		blt.rampage = true;
		blt.damage = damage;

		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 180 - 28;
		blt.speed = 25;
		blt.image_angle = blt.direction - 90;
		blt.rampage = true;
		blt.damage = damage;
		
		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 56;
		blt.speed = 25;
		blt.image_angle = blt.direction - 90;
		blt.rampage = true;
		blt.damage = damage;

		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 180 - 56;
		blt.speed = 25;
		blt.image_angle = blt.direction - 90;
		blt.rampage = true;
		blt.damage = damage;
	}
}
else{
	time = 0;
	rtime = 0;
}