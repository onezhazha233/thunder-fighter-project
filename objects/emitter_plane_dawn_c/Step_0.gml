live;
event_inherited();

if(alarm[1] = -1)rtime = 0;

if(enabled = true){
	time -= 1;
	if(time <= 0)time = 0;
	if(time mod 5 = 1){
		spd = 22.2;
		damage = 0.521;
		switch(weapon_level){
			case 0:damage = 0.521/3;break;
			case 1:damage = 0.521/3*1.3;break;
			case 2:damage = 0.521/3*1.7;break;
			case 3:damage = 0.521/3*2;break;
		}
		a = MakePlayerBullet(x-16*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_c_small;
		a.collision_effect_sequence = seq_bullet_effect_dawn_c;
		a.image_index = 2;
		a.direction = 90;
		a.speed = spd;
		a.damage = damage;
		a = MakePlayerBullet(x+16*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_c_small;
		a.collision_effect_sequence = seq_bullet_effect_dawn_c;
		a.image_index = 2;
		a.direction = 90;
		a.speed = spd;
		a.damage = damage;
		a = MakePlayerBullet(x-20*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_c_small;
		a.collision_effect_sequence = seq_bullet_effect_dawn_c;
		a.image_index = 1;
		a.direction = 90+3;
		a.image_angle = 3;
		a.speed = spd;
		a.damage = damage;
		a = MakePlayerBullet(x+20*scale_x,y-50*scale_y,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_c_small;
		a.collision_effect_sequence = seq_bullet_effect_dawn_c;
		a.image_index = 1;
		a.direction = 90-3;
		a.image_angle = -3;
		a.speed = spd;
		a.damage = damage;
		a = MakePlayerBullet(x-30*scale_x,y-40*scale_y,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_c_small;
		a.collision_effect_sequence = seq_bullet_effect_dawn_c;
		a.image_index = 1;
		a.direction = 90+10;
		a.image_angle = 10;
		a.speed = spd;
		a.damage = damage;
		a = MakePlayerBullet(x+30*scale_x,y-40*scale_y,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_c_small;
		a.collision_effect_sequence = seq_bullet_effect_dawn_c;
		a.image_index = 1;
		a.direction = 90-10;
		a.image_angle = -10;
		a.speed = spd;
		a.damage = damage;
		if(weapon_level > 0){
			a = MakePlayerBullet(x-40*scale_x,y-40*scale_y,bullet_player_plane_dawn_small);
			a.sprite_index = spr_bullet_player_dawn_c_small;
			a.collision_effect_sequence = seq_bullet_effect_dawn_c;
			a.image_index = 1;
			a.direction = 90+15.5;
			a.image_angle = 15.5;
			a.speed = spd;
			a.damage = damage;
			a = MakePlayerBullet(x+40*scale_x,y-40*scale_y,bullet_player_plane_dawn_small);
			a.sprite_index = spr_bullet_player_dawn_c_small;
			a.collision_effect_sequence = seq_bullet_effect_dawn_c;
			a.image_index = 1;
			a.direction = 90-15.5;
			a.image_angle = -15.5;
			a.speed = spd;
			a.damage = damage;
		}
		if(weapon_level > 1){
			a = MakePlayerBullet(x-52*scale_x,y-25*scale_y,bullet_player_plane_dawn_small);
			a.sprite_index = spr_bullet_player_dawn_c_small;
			a.collision_effect_sequence = seq_bullet_effect_dawn_c;
			a.direction = 90+22;
			a.image_angle = 22;
			a.speed = spd;
			a.damage = damage;
			a = MakePlayerBullet(x+52*scale_x,y-25*scale_y,bullet_player_plane_dawn_small);
			a.sprite_index = spr_bullet_player_dawn_c_small;
			a.collision_effect_sequence = seq_bullet_effect_dawn_c;
			a.direction = 90-22;
			a.image_angle = -22;
			a.speed = spd;
			a.damage = damage;
		}
		if(weapon_level > 2){
			a = MakePlayerBullet(x-65*scale_x,y,bullet_player_plane_dawn_small);
			a.sprite_index = spr_bullet_player_dawn_c_small;
			a.collision_effect_sequence = seq_bullet_effect_dawn_c;
			a.direction = 90+30;
			a.image_angle = 30;
			a.speed = spd;
			a.damage = damage;
			a = MakePlayerBullet(x+65*scale_x,y,bullet_player_plane_dawn_small);
			a.sprite_index = spr_bullet_player_dawn_c_small;
			a.collision_effect_sequence = seq_bullet_effect_dawn_c;
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