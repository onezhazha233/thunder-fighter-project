live;
event_inherited();

if(alarm[1] = -1)rtime = 0;

time -= 1
if(time <= 0)time = 0;
if(time mod 5 = 1){
	spd = 33;
	damage = 0.521;
	switch(weapon_level){
		case 0:damage = 0.1302;break;
		case 1:damage = 0.1302*1.3;break;
		case 2:damage = 0.1302*1.7;break;
		case 3:damage = 0.1302*2;break;
	}
	a = MakePlayerBullet(x-16*scale_x,y-50,bullet_player_plane_dawn_small);
	a.sprite_index = spr_bullet_player_dawn_d_small;
	a.image_index = 2;
	a.direction = 90;
	a.speed = spd;
	a.damage = damage;
	a = MakePlayerBullet(x+16*scale_x,y-50,bullet_player_plane_dawn_small);
	a.sprite_index = spr_bullet_player_dawn_d_small;
	a.image_index = 2;
	a.direction = 90;
	a.speed = spd;
	a.damage = damage;
	a = MakePlayerBullet(x-20*scale_x,y-50,bullet_player_plane_dawn_small);
	a.sprite_index = spr_bullet_player_dawn_d_small;
	a.image_index = 2;
	a.direction = 90+3;
	a.image_angle = 3;
	a.speed = spd;
	a.damage = damage;
	a = MakePlayerBullet(x+20*scale_x,y-50,bullet_player_plane_dawn_small);
	a.sprite_index = spr_bullet_player_dawn_d_small;
	a.image_index = 2;
	a.direction = 90-3;
	a.image_angle = -3;
	a.speed = spd;
	a.damage = damage;
	a = MakePlayerBullet(x-25*scale_x,y-30,bullet_player_plane_dawn_small);
	a.sprite_index = spr_bullet_player_dawn_d_small;
	a.image_index = 1;
	a.direction = 90+7;
	a.image_angle = 7;
	a.speed = spd;
	a.damage = damage;
	a = MakePlayerBullet(x+25*scale_x,y-30,bullet_player_plane_dawn_small);
	a.sprite_index = spr_bullet_player_dawn_d_small;
	a.image_index = 1;
	a.direction = 90-7;
	a.image_angle = -7;
	a.speed = spd;
	a.damage = damage;
	a = MakePlayerBullet(x-35*scale_x,y-30,bullet_player_plane_dawn_small);
	a.sprite_index = spr_bullet_player_dawn_d_small;
	a.image_index = 1;
	a.direction = 90+12;
	a.image_angle = 12;
	a.speed = spd;
	a.damage = damage;
	a = MakePlayerBullet(x+35*scale_x,y-30,bullet_player_plane_dawn_small);
	a.sprite_index = spr_bullet_player_dawn_d_small;
	a.image_index = 1;
	a.direction = 90-12;
	a.image_angle = -12;
	a.speed = spd;
	a.damage = damage;
	if(weapon_level > 0){
		a = MakePlayerBullet(x-43*scale_x,y-30,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_d_small;
		a.image_index = 1;
		a.direction = 90+18;
		a.image_angle = 18;
		a.speed = spd;
		a.damage = damage;
		a = MakePlayerBullet(x+43*scale_x,y-30,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_d_small;
		a.image_index = 1;
		a.direction = 90-18;
		a.image_angle = -18;
		a.speed = spd;
		a.damage = damage;
	}
	if(weapon_level > 1){
		a = MakePlayerBullet(x-50*scale_x,y-15,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_d_small;
		a.direction = 90+25;
		a.image_angle = 25;
		a.speed = spd;
		a.damage = damage;
		a = MakePlayerBullet(x+50*scale_x,y-15,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_d_small;
		a.direction = 90-25;
		a.image_angle = -25;
		a.speed = spd;
		a.damage = damage;
	}
	if(weapon_level > 2){
		a = MakePlayerBullet(x-65*scale_x,y,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_d_small;
		a.direction = 90+33;
		a.image_angle = 33;
		a.speed = spd;
		a.damage = damage;
		a = MakePlayerBullet(x+65*scale_x,y,bullet_player_plane_dawn_small);
		a.sprite_index = spr_bullet_player_dawn_d_small;
		a.direction = 90-33;
		a.image_angle = -33;
		a.speed = spd;
		a.damage = damage;
	}
	fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
	fire.sprite_index = spr_bullet_player_assault_d_fire;
	fire.scale_x = scale_x;
	fire.scale_y = scale_y;
	fire.y_offset = -10;
	array_push(follow_inst,fire);
}