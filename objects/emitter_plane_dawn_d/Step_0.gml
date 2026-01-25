live;
event_inherited();

if(alarm[1] = -1)rtime = 0;

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		spd = 33;
		blt = MakePlayerBullet(x-16*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		blt.sprite_index = spr_bullet_player_dawn_d_small;
		blt.collision_effect = seq_bullet_effect_dawn_d;
		blt.image_index = 2;
		blt.direction = 90;
		blt.speed = spd;
		blt.damage = damage;
		blt = MakePlayerBullet(x+16*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		blt.sprite_index = spr_bullet_player_dawn_d_small;
		blt.collision_effect = seq_bullet_effect_dawn_d;
		blt.image_index = 2;
		blt.direction = 90;
		blt.speed = spd;
		blt.damage = damage;
		blt = MakePlayerBullet(x-20*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		blt.sprite_index = spr_bullet_player_dawn_d_small;
		blt.collision_effect = seq_bullet_effect_dawn_d;
		blt.image_index = 2;
		blt.direction = 90+3;
		blt.image_angle = 3;
		blt.speed = spd;
		blt.damage = damage;
		blt = MakePlayerBullet(x+20*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		blt.sprite_index = spr_bullet_player_dawn_d_small;
		blt.collision_effect = seq_bullet_effect_dawn_d;
		blt.image_index = 2;
		blt.direction = 90-3;
		blt.image_angle = -3;
		blt.speed = spd;
		blt.damage = damage;
		blt = MakePlayerBullet(x-25*scale_x,y-30*scale_y,bullet_player_plane_dawn_small);
		blt.sprite_index = spr_bullet_player_dawn_d_small;
		blt.collision_effect = seq_bullet_effect_dawn_d;
		blt.image_index = 1;
		blt.direction = 90+7;
		blt.image_angle = 7;
		blt.speed = spd;
		blt.damage = damage;
		blt = MakePlayerBullet(x+25*scale_x,y-30*scale_y,bullet_player_plane_dawn_small);
		blt.sprite_index = spr_bullet_player_dawn_d_small;
		blt.collision_effect = seq_bullet_effect_dawn_d;
		blt.image_index = 1;
		blt.direction = 90-7;
		blt.image_angle = -7;
		blt.speed = spd;
		blt.damage = damage;
		blt = MakePlayerBullet(x-35*scale_x,y-30*scale_y,bullet_player_plane_dawn_small);
		blt.sprite_index = spr_bullet_player_dawn_d_small;
		blt.collision_effect = seq_bullet_effect_dawn_d;
		blt.image_index = 1;
		blt.direction = 90+12;
		blt.image_angle = 12;
		blt.speed = spd;
		blt.damage = damage;
		blt = MakePlayerBullet(x+35*scale_x,y-30*scale_y,bullet_player_plane_dawn_small);
		blt.sprite_index = spr_bullet_player_dawn_d_small;
		blt.collision_effect = seq_bullet_effect_dawn_d;
		blt.image_index = 1;
		blt.direction = 90-12;
		blt.image_angle = -12;
		blt.speed = spd;
		blt.damage = damage;
		if(weapon_level > 0){
			blt = MakePlayerBullet(x-43*scale_x,y-30*scale_y,bullet_player_plane_dawn_small);
			blt.sprite_index = spr_bullet_player_dawn_d_small;
			blt.collision_effect = seq_bullet_effect_dawn_d;
			blt.image_index = 1;
			blt.direction = 90+18;
			blt.image_angle = 18;
			blt.speed = spd;
			blt.damage = damage;
			blt = MakePlayerBullet(x+43*scale_x,y-30*scale_y,bullet_player_plane_dawn_small);
			blt.sprite_index = spr_bullet_player_dawn_d_small;
			blt.collision_effect = seq_bullet_effect_dawn_d;
			blt.image_index = 1;
			blt.direction = 90-18;
			blt.image_angle = -18;
			blt.speed = spd;
			blt.damage = damage;
		}
		if(weapon_level > 1){
			blt = MakePlayerBullet(x-50*scale_x,y-15*scale_y,bullet_player_plane_dawn_small);
			blt.sprite_index = spr_bullet_player_dawn_d_small;
			blt.collision_effect = seq_bullet_effect_dawn_d;
			blt.direction = 90+25;
			blt.image_angle = 25;
			blt.speed = spd;
			blt.damage = damage;
			blt = MakePlayerBullet(x+50*scale_x,y-15*scale_y,bullet_player_plane_dawn_small);
			blt.sprite_index = spr_bullet_player_dawn_d_small;
			blt.collision_effect = seq_bullet_effect_dawn_d;
			blt.direction = 90-25;
			blt.image_angle = -25;
			blt.speed = spd;
			blt.damage = damage;
		}
		if(weapon_level > 2){
			blt = MakePlayerBullet(x-65*scale_x,y,bullet_player_plane_dawn_small);
			blt.sprite_index = spr_bullet_player_dawn_d_small;
			blt.collision_effect = seq_bullet_effect_dawn_d;
			blt.direction = 90+33;
			blt.image_angle = 33;
			blt.speed = spd;
			blt.damage = damage;
			blt = MakePlayerBullet(x+65*scale_x,y,bullet_player_plane_dawn_small);
			blt.sprite_index = spr_bullet_player_dawn_d_small;
			blt.collision_effect = seq_bullet_effect_dawn_d;
			blt.direction = 90-33;
			blt.image_angle = -33;
			blt.speed = spd;
			blt.damage = damage;
		}
		fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
		fire.sprite_index = spr_bullet_player_assault_d_fire;
		fire.scale_x = scale_x;
		fire.scale_y = scale_y;
		fire.y_offset = -10;
		array_push(follow_inst,fire);
		audio_play_sound(snd_plane_shoot,0,0);
	}
}
else{
	time = 0;
}