live;
event_inherited();

if(enabled = true){
	if(time > 0)time -= 1;
	if(time mod 7 = 1){
		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 28;
		blt.speed = 15;
		blt.image_angle = blt.direction - 90;
		blt.image_index = 1;
		blt.collision_effect = seq_bullet_effect_dawn_b;
		blt.damage = damage;

		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 180 - 28;
		blt.speed = 15;
		blt.image_angle = blt.direction - 90;
		blt.image_index = 1;
		blt.collision_effect = seq_bullet_effect_dawn_b;
		blt.damage = damage;
		
		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 56;
		blt.speed = 15;
		blt.image_angle = blt.direction - 90;
		blt.image_index = 1;
		blt.collision_effect = seq_bullet_effect_dawn_b;
		blt.damage = damage;

		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 180 - 56;
		blt.speed = 15;
		blt.image_angle = blt.direction - 90;
		blt.image_index = 1;
		blt.collision_effect = seq_bullet_effect_dawn_b;
		blt.damage = damage;
	}
	if(rtime > 0)rtime -= 1;
	if(rtime mod 5 = 1){
		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 28;
		blt.speed = 25;
		blt.image_angle = blt.direction - 90;
		blt.rampage = true;
		blt.image_index = 1;
		blt.collision_effect = seq_bullet_effect_dawn_b;
		blt.damage = damage;

		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 180 - 28;
		blt.speed = 25;
		blt.image_angle = blt.direction - 90;
		blt.rampage = true;
		blt.image_index = 1;
		blt.collision_effect = seq_bullet_effect_dawn_b;
		blt.damage = damage;
		
		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 56;
		blt.speed = 25;
		blt.image_angle = blt.direction - 90;
		blt.rampage = true;
		blt.image_index = 1;
		blt.collision_effect = seq_bullet_effect_dawn_b;
		blt.damage = damage;

		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 180 - 56;
		blt.speed = 25;
		blt.image_angle = blt.direction - 90;
		blt.rampage = true;
		blt.image_index = 1;
		blt.collision_effect = seq_bullet_effect_dawn_b;
		blt.damage = damage;
	}
}
else{
	time = 0;
	rtime = 0;
}