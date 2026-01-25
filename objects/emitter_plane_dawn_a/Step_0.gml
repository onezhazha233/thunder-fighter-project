live;
event_inherited();

if(alarm[1] = -1)rtime = 0;

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		spd = 18;
		blt = MakePlayerBullet(x-16*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		blt.sprite_index = spr_bullet_player_dawn_a_small;
		blt.image_index = 2;
		blt.direction = 90;
		blt.speed = spd;
		blt.damage = damage;
		blt = MakePlayerBullet(x+16*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		blt.sprite_index = spr_bullet_player_dawn_a_small;
		blt.image_index = 2;
		blt.direction = 90;
		blt.speed = spd;
		blt.damage = damage;
		if(weapon_level > 0){
			blt = MakePlayerBullet(x-16*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
			blt.image_index = 1;
			blt.direction = 90+9;
			blt.image_angle = 9;
			blt.speed = spd;
			blt.damage = damage;
			blt = MakePlayerBullet(x+16*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
			blt.image_index = 1;
			blt.direction = 90-9;
			blt.image_angle = -9;
			blt.speed = spd;
			blt.damage = damage;
		}
		if(weapon_level > 1){
			blt = MakePlayerBullet(x-35*scale_x,y-25*scale_y,bullet_player_plane_dawn_small);
			blt.direction = 90+20;
			blt.image_angle = 20;
			blt.speed = spd;
			blt.damage = damage;
			blt = MakePlayerBullet(x+35*scale_x,y-25*scale_y,bullet_player_plane_dawn_small);
			blt.direction = 90-20;
			blt.image_angle = -20;
			blt.speed = spd;
			blt.damage = damage;
		}
		if(weapon_level > 2){
			blt = MakePlayerBullet(x-50*scale_x,y,bullet_player_plane_dawn_small);
			blt.direction = 90+31.5;
			blt.image_angle = 31.5;
			blt.speed = spd;
			blt.damage = damage;
			blt = MakePlayerBullet(x+50*scale_x,y,bullet_player_plane_dawn_small);
			blt.direction = 90-31.5;
			blt.image_angle = -31.5;
			blt.speed = spd;
			blt.damage = damage;
		}
		fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
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