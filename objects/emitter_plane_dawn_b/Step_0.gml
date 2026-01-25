live;
event_inherited();

if(alarm[1] = -1)rtime = 0;

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		spd = 20;
		blt = MakePlayerBullet(x-16*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		blt.sprite_index = spr_bullet_player_dawn_b_small;
		blt.collision_effect = seq_bullet_effect_dawn_b;
		blt.image_index = 2;
		blt.direction = 90;
		blt.speed = spd;
		blt.damage = damage;
		blt = MakePlayerBullet(x+16*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		blt.sprite_index = spr_bullet_player_dawn_b_small;
		blt.collision_effect = seq_bullet_effect_dawn_b;
		blt.image_index = 2;
		blt.direction = 90;
		blt.speed = spd;
		blt.damage = damage;
		blt = MakePlayerBullet(x-20*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		blt.sprite_index = spr_bullet_player_dawn_b_small;
		blt.collision_effect = seq_bullet_effect_dawn_b;
		blt.image_index = 1;
		blt.direction = 90+2;
		blt.image_angle = 2;
		blt.speed = spd;
		blt.damage = damage;
		blt = MakePlayerBullet(x+20*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		blt.sprite_index = spr_bullet_player_dawn_b_small;
		blt.collision_effect = seq_bullet_effect_dawn_b;
		blt.image_index = 1;
		blt.direction = 90-2;
		blt.image_angle = -2;
		blt.speed = spd;
		blt.damage = damage;
		if(weapon_level > 0){
			blt = MakePlayerBullet(x-35*scale_x,y-40*scale_y,bullet_player_plane_dawn_small);
			blt.sprite_index = spr_bullet_player_dawn_b_small;
			blt.collision_effect = seq_bullet_effect_dawn_b;
			blt.image_index = 1;
			blt.direction = 90+12.5;
			blt.image_angle = 12.5;
			blt.speed = spd;
			blt.damage = damage;
			blt = MakePlayerBullet(x+35*scale_x,y-40*scale_y,bullet_player_plane_dawn_small);
			blt.sprite_index = spr_bullet_player_dawn_b_small;
			blt.collision_effect = seq_bullet_effect_dawn_b;
			blt.image_index = 1;
			blt.direction = 90-12.5;
			blt.image_angle = -12.5;
			blt.speed = spd;
			blt.damage = damage;
		}
		if(weapon_level > 1){
			blt = MakePlayerBullet(x-50*scale_x,y-25*scale_y,bullet_player_plane_dawn_small);
			blt.sprite_index = spr_bullet_player_dawn_b_small;
			blt.collision_effect = seq_bullet_effect_dawn_b;
			blt.direction = 90+20;
			blt.image_angle = 20;
			blt.speed = spd;
			blt.damage = damage;
			blt = MakePlayerBullet(x+50*scale_x,y-25*scale_y,bullet_player_plane_dawn_small);
			blt.sprite_index = spr_bullet_player_dawn_b_small;
			blt.collision_effect = seq_bullet_effect_dawn_b;
			blt.direction = 90-20;
			blt.image_angle = -20;
			blt.speed = spd;
			blt.damage = damage;
		}
		if(weapon_level > 2){
			blt = MakePlayerBullet(x-65*scale_x,y,bullet_player_plane_dawn_small);
			blt.sprite_index = spr_bullet_player_dawn_b_small;
			blt.collision_effect = seq_bullet_effect_dawn_b;
			blt.direction = 90+30;
			blt.image_angle = 30;
			blt.speed = spd;
			blt.damage = damage;
			blt = MakePlayerBullet(x+65*scale_x,y,bullet_player_plane_dawn_small);
			blt.sprite_index = spr_bullet_player_dawn_b_small;
			blt.collision_effect = seq_bullet_effect_dawn_b;
			blt.direction = 90-30;
			blt.image_angle = -30;
			blt.speed = spd;
			blt.damage = damage;
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