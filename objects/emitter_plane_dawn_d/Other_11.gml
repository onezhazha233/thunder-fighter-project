live;
rtime += 1
spd = 65
blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
blt.sprite_index = spr_bullet_player_dawn_d_big;
blt.collision_effect = seq_bullet_effect_dawn_d;
blt.image_index = 2;
blt.direction = 90;
blt.speed = spd;
blt.damage = damage;
if(sin(rtime/2-12) > -0.9){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.sprite_index = spr_bullet_player_dawn_d_big;
	blt.collision_effect = seq_bullet_effect_dawn_d;
	blt.image_index = 2;
	blt.direction = 90;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime/2-4.4) > -0.9){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.sprite_index = spr_bullet_player_dawn_d_big;
	blt.collision_effect = seq_bullet_effect_dawn_d;
	blt.image_index = 2;
	blt.direction = 90+3;
	blt.image_angle = 3;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime/2-2.7) > -0.9){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.sprite_index = spr_bullet_player_dawn_d_big;
	blt.collision_effect = seq_bullet_effect_dawn_d;
	blt.image_index = 2;
	blt.direction = 90-3;
	blt.image_angle = -3;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime/2-1.4) > -0.9){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.sprite_index = spr_bullet_player_dawn_d_big;
	blt.collision_effect = seq_bullet_effect_dawn_d;
	blt.image_index = 2;
	blt.direction = 90+7;
	blt.image_angle = 7;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime/2-0.7) > -0.9){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.sprite_index = spr_bullet_player_dawn_d_big;
	blt.collision_effect = seq_bullet_effect_dawn_d;
	blt.image_index = 2;
	blt.direction = 90-7;
	blt.image_angle = -7;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime/2-10) > -0.9){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.sprite_index = spr_bullet_player_dawn_d_big;
	blt.collision_effect = seq_bullet_effect_dawn_d;
	blt.image_index = 1;
	blt.direction = 90+12;
	blt.image_angle = 12;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime/2-6.7) > -0.9){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.sprite_index = spr_bullet_player_dawn_d_big;
	blt.collision_effect = seq_bullet_effect_dawn_d;
	blt.image_index = 1;
	blt.direction = 90-12;
	blt.image_angle = -12;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime/2+12) > -0.9){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.sprite_index = spr_bullet_player_dawn_d_big;
	blt.collision_effect = seq_bullet_effect_dawn_d;
	blt.image_index = 1;
	blt.direction = 90+18;
	blt.image_angle = 18;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime/2+5) > -0.8){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.sprite_index = spr_bullet_player_dawn_d_big;
	blt.collision_effect = seq_bullet_effect_dawn_d;
	blt.image_index = 1;
	blt.direction = 90-18;
	blt.image_angle = -18;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime/2+2.5) > -0.8){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.sprite_index = spr_bullet_player_dawn_d_big;
	blt.collision_effect = seq_bullet_effect_dawn_d;
	blt.direction = 90+25;
	blt.image_angle = 25;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime/2) > -0.8){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.sprite_index = spr_bullet_player_dawn_d_big;
	blt.collision_effect = seq_bullet_effect_dawn_d;
	blt.direction = 90-25;
	blt.image_angle = -25;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime-2.5) > -0.7){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.sprite_index = spr_bullet_player_dawn_d_big;
	blt.collision_effect = seq_bullet_effect_dawn_d;
	blt.direction = 90+33;
	blt.image_angle = 33;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime-8.5) > -0.7){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.sprite_index = spr_bullet_player_dawn_d_big;
	blt.collision_effect = seq_bullet_effect_dawn_d;
	blt.direction = 90-33;
	blt.image_angle = -33;
	blt.speed = spd;
	blt.damage = damage;
}
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
fire.sprite_index = spr_bullet_player_assault_d_fire
fire.image_index = 1
fire.scale_x = scale_x;
fire.scale_y = scale_y;
fire.y_offset = -10;
array_push(follow_inst,fire);
audio_play_sound(snd_plane_shoot,0,0);