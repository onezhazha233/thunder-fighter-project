live;
rtime += 1
spd = 28
damage = 0.57
a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
a.sprite_index = spr_bullet_player_dawn_a_big;
a.image_index = 2;
a.direction = 90;
a.speed = spd;
a.damage = damage;
if(sin(rtime/2-12) > -0.9){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.sprite_index = spr_bullet_player_dawn_a_big;
	a.image_index = 2;
	a.direction = 90;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime/2+12) > -0.9){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.image_index = 1;
	a.direction = 90+8;
	a.image_angle = 8;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime/2+5) > -0.8){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.image_index = 1;
	a.direction = 90-8;
	a.image_angle = -8;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime/2+2.5) > -0.8){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.direction = 90+20;
	a.image_angle = 20;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime/2) > -0.8){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.direction = 90-20;
	a.image_angle = -20;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime-2.5) > -0.7){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.direction = 90+32;
	a.image_angle = 32;
	a.speed = spd;
	a.damage = damage;
}
if(sin(rtime-8.5) > -0.7){
	a = MakePlayerBullet(x,y,bullet_player_plane_dawn_big);
	a.direction = 90-32;
	a.image_angle = -32;
	a.speed = spd;
	a.damage = damage;
}
fire = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER-10,bullet_player_assault_fire);
fire.image_index = 1
fire.scale_x = scale_x;
fire.scale_y = scale_y;
fire.y_offset = -10;
array_push(follow_inst,fire);