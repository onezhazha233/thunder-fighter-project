live;
event_inherited();

if(alarm[1] = -1)rtime = 0;

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		spd = 20;
		a = MakePlayerBullet(x-16*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_b_small;
		a.collision_effect_sequence = seq_bullet_effect_dawn_b;
		a.image_index = 2;
		a.direction = 90;
		a.speed = spd;
		a.damage = damage;
		a = MakePlayerBullet(x+16*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_b_small;
		a.collision_effect_sequence = seq_bullet_effect_dawn_b;
		a.image_index = 2;
		a.direction = 90;
		a.speed = spd;
		a.damage = damage;
		a = MakePlayerBullet(x-20*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_b_small;
		a.collision_effect_sequence = seq_bullet_effect_dawn_b;
		a.image_index = 1;
		a.direction = 90+2;
		a.image_angle = 2;
		a.speed = spd;
		a.damage = damage;
		a = MakePlayerBullet(x+20*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_b_small;
		a.collision_effect_sequence = seq_bullet_effect_dawn_b;
		a.image_index = 1;
		a.direction = 90-2;
		a.image_angle = -2;
		a.speed = spd;
		a.damage = damage;
		if(weapon_level > 0){
			a = MakePlayerBullet(x-35*scale_x,y-40*scale_y,bullet_player_plane_dawn_small);
			a.sprite_index = spr_bullet_player_dawn_b_small;
			a.collision_effect_sequence = seq_bullet_effect_dawn_b;
			a.image_index = 1;
			a.direction = 90+12.5;
			a.image_angle = 12.5;
			a.speed = spd;
			a.damage = damage;
			a = MakePlayerBullet(x+35*scale_x,y-40*scale_y,bullet_player_plane_dawn_small);
			a.sprite_index = spr_bullet_player_dawn_b_small;
			a.collision_effect_sequence = seq_bullet_effect_dawn_b;
			a.image_index = 1;
			a.direction = 90-12.5;
			a.image_angle = -12.5;
			a.speed = spd;
			a.damage = damage;
		}
		if(weapon_level > 1){
			a = MakePlayerBullet(x-50*scale_x,y-25*scale_y,bullet_player_plane_dawn_small);
			a.sprite_index = spr_bullet_player_dawn_b_small;
			a.collision_effect_sequence = seq_bullet_effect_dawn_b;
			a.direction = 90+20;
			a.image_angle = 20;
			a.speed = spd;
			a.damage = damage;
			a = MakePlayerBullet(x+50*scale_x,y-25*scale_y,bullet_player_plane_dawn_small);
			a.sprite_index = spr_bullet_player_dawn_b_small;
			a.collision_effect_sequence = seq_bullet_effect_dawn_b;
			a.direction = 90-20;
			a.image_angle = -20;
			a.speed = spd;
			a.damage = damage;
		}
		if(weapon_level > 2){
			a = MakePlayerBullet(x-65*scale_x,y,bullet_player_plane_dawn_small);
			a.sprite_index = spr_bullet_player_dawn_b_small;
			a.collision_effect_sequence = seq_bullet_effect_dawn_b;
			a.direction = 90+30;
			a.image_angle = 30;
			a.speed = spd;
			a.damage = damage;
			a = MakePlayerBullet(x+65*scale_x,y,bullet_player_plane_dawn_small);
			a.sprite_index = spr_bullet_player_dawn_b_small;
			a.collision_effect_sequence = seq_bullet_effect_dawn_b;
			a.direction = 90-30;
			a.image_angle = -30;
			a.speed = spd;
			a.damage = damage;
		}
		fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
		fire.scale_x = scale_x;
		fire.scale_y = scale_y;
		fire.y_offset = -10;
		array_push(follow_inst,fire);
	}
}
else{
	time = 0;
}