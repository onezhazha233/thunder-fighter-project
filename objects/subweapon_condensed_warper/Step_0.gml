live;
event_inherited();

if(enabled = true){
	if(time > 0)time -= 1;
	if(time mod 7 = 1){
		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 34;
		blt.speed = 15;
		blt.image_angle = blt.direction - 90;
		blt.image_index = 3;
		blt.cover_alpha_factor = 1.5;
		blt.collision_effect = seq_bullet_effect_dawn_c;
		blt.damage = damage;

		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 180 - 34;
		blt.speed = 15;
		blt.image_angle = blt.direction - 90;
		blt.image_index = 3;
		blt.cover_alpha_factor = 1.5;
		blt.collision_effect = seq_bullet_effect_dawn_c;
		blt.damage = damage;
		
		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 42;
		blt.speed = 15;
		blt.image_angle = blt.direction - 90;
		blt.image_index = 3;
		blt.cover_alpha_factor = 1.5;
		blt.collision_effect = seq_bullet_effect_dawn_c;
		blt.damage = damage;

		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 180 - 42;
		blt.speed = 15;
		blt.image_angle = blt.direction - 90;
		blt.image_index = 3;
		blt.cover_alpha_factor = 1.5;
		blt.collision_effect = seq_bullet_effect_dawn_c;
		blt.damage = damage;
		
		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 50;
		blt.speed = 15;
		blt.image_angle = blt.direction - 90;
		blt.image_index = 3;
		blt.cover_alpha_factor = 1.5;
		blt.collision_effect = seq_bullet_effect_dawn_c;
		blt.damage = damage;

		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 180 - 50;
		blt.speed = 15;
		blt.image_angle = blt.direction - 90;
		blt.image_index = 3;
		blt.cover_alpha_factor = 1.5;
		blt.collision_effect = seq_bullet_effect_dawn_c;
		blt.damage = damage;
	}
	if(rtime > 0)rtime -= 1;
	if(rtime mod 5 = 1){
		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 34;
		blt.speed = 25;
		blt.image_angle = blt.direction - 90;
		blt.rampage = true;
		blt.image_index = 3;
		blt.cover_alpha_factor = 1.5;
		blt.collision_effect = seq_bullet_effect_dawn_d;
		blt.damage = damage;

		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 180 - 34;
		blt.speed = 25;
		blt.image_angle = blt.direction - 90;
		blt.rampage = true;
		blt.image_index = 3;
		blt.cover_alpha_factor = 1.5;
		blt.collision_effect = seq_bullet_effect_dawn_d;
		blt.damage = damage;
		
		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 42;
		blt.speed = 25;
		blt.image_angle = blt.direction - 90;
		blt.rampage = true;
		blt.image_index = 3;
		blt.cover_alpha_factor = 1.5;
		blt.collision_effect = seq_bullet_effect_dawn_d;
		blt.damage = damage;

		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 180 - 42;
		blt.speed = 25;
		blt.image_angle = blt.direction - 90;
		blt.rampage = true;
		blt.image_index = 3;
		blt.cover_alpha_factor = 1.5;
		blt.collision_effect = seq_bullet_effect_dawn_d;
		blt.damage = damage;
		
		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 50;
		blt.speed = 25;
		blt.image_angle = blt.direction - 90;
		blt.rampage = true;
		blt.image_index = 3;
		blt.cover_alpha_factor = 1.5;
		blt.collision_effect = seq_bullet_effect_dawn_d;
		blt.damage = damage;

		blt = MakePlayerBullet(x,y,bullet_player_warper);
		blt.direction = 180 - 50;
		blt.speed = 25;
		blt.image_angle = blt.direction - 90;
		blt.rampage = true;
		blt.image_index = 3;
		blt.cover_alpha_factor = 1.5;
		blt.collision_effect = seq_bullet_effect_dawn_d;
		blt.damage = damage;
	}
}
else{
	time = 0;
	rtime = 0;
}