live;
rtime += 1
spd = 46
damage = 0.2875/4*3
a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
a.sprite_index = spr_bullet_player_dawn_c_big;
a.collision_effect_sequence = seq_bullet_effect_dawn_c;
a.image_index = 2;
a.direction = 90;
a.speed = spd;
a.damage = damage;
if(sin(rtime/2-12) > -0.9){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.sprite_index = spr_bullet_player_dawn_c_big;
	a.collision_effect_sequence = seq_bullet_effect_dawn_c;
	a.image_index = 2;
	a.direction = 90;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime/2-4.4) > -0.9){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.sprite_index = spr_bullet_player_dawn_c_big;
	a.collision_effect_sequence = seq_bullet_effect_dawn_c;
	a.image_index = 2;
	a.direction = 90+3;
	a.image_angle = 3;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime/2-2.7) > -0.9){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.sprite_index = spr_bullet_player_dawn_c_big;
	a.collision_effect_sequence = seq_bullet_effect_dawn_c;
	a.image_index = 2;
	a.direction = 90-3;
	a.image_angle = -3;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime/2-10) > -0.9){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.sprite_index = spr_bullet_player_dawn_c_big;
	a.collision_effect_sequence = seq_bullet_effect_dawn_c;
	a.image_index = 2;
	a.direction = 90+10;
	a.image_angle = 10;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime/2-6.7) > -0.9){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.sprite_index = spr_bullet_player_dawn_c_big;
	a.collision_effect_sequence = seq_bullet_effect_dawn_c;
	a.image_index = 2;
	a.direction = 90-10;
	a.image_angle = -10;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime/2+12) > -0.9){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.sprite_index = spr_bullet_player_dawn_c_big;
	a.collision_effect_sequence = seq_bullet_effect_dawn_c;
	a.image_index = 1;
	a.direction = 90+15.5;
	a.image_angle = 15.5;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime/2+5) > -0.8){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.sprite_index = spr_bullet_player_dawn_c_big;
	a.collision_effect_sequence = seq_bullet_effect_dawn_c;
	a.image_index = 1;
	a.direction = 90-15.5;
	a.image_angle = -15.5;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime/2+2.5) > -0.8){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.sprite_index = spr_bullet_player_dawn_c_big;
	a.collision_effect_sequence = seq_bullet_effect_dawn_c;
	a.direction = 90+22;
	a.image_angle = 22;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime/2) > -0.8){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.sprite_index = spr_bullet_player_dawn_c_big;
	a.collision_effect_sequence = seq_bullet_effect_dawn_c;
	a.direction = 90-22;
	a.image_angle = -22;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime-2.5) > -0.7){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.sprite_index = spr_bullet_player_dawn_c_big;
	a.collision_effect_sequence = seq_bullet_effect_dawn_c;
	a.direction = 90+30;
	a.image_angle = 30;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime-8.5) > -0.7){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.sprite_index = spr_bullet_player_dawn_c_big;
	a.collision_effect_sequence = seq_bullet_effect_dawn_c;
	a.direction = 90-30;
	a.image_angle = -30;
	a.speed = spd;
	a.damage = damage;
}
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
fire.image_index = 1
fire.scale_x = scale_x;
fire.scale_y = scale_y;
fire.y_offset = -10;
array_push(follow_inst,fire);