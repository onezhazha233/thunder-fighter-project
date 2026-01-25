live;
rtime += 1
spd = 28
blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
blt.sprite_index = spr_bullet_player_dawn_a_big;
blt.image_index = 2;
blt.direction = 90;
blt.speed = spd;
blt.damage = damage;
if(sin(rtime/2-12) > -0.9){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.sprite_index = spr_bullet_player_dawn_a_big;
	blt.image_index = 2;
	blt.direction = 90;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime/2+12) > -0.9){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.image_index = 1;
	blt.direction = 90+8;
	blt.image_angle = 8;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime/2+5) > -0.8){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.image_index = 1;
	blt.direction = 90-8;
	blt.image_angle = -8;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime/2+2.5) > -0.8){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.direction = 90+20;
	blt.image_angle = 20;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime/2) > -0.8){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.direction = 90-20;
	blt.image_angle = -20;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime-2.5) > -0.7){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.direction = 90+32;
	blt.image_angle = 32;
	blt.speed = spd;
	blt.damage = damage;
}
if(sin(rtime-8.5) > -0.7){
	blt = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	blt.direction = 90-32;
	blt.image_angle = -32;
	blt.speed = spd;
	blt.damage = damage;
}
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
fire.image_index = 1
fire.scale_x = scale_x;
fire.scale_y = scale_y;
fire.y_offset = -10;
array_push(follow_inst,fire);
audio_play_sound(snd_plane_shoot,0,0);