live;
time += 1

if(time = 30){
	layer_sequence_destroy(scseq);
	scseq = layer_sequence_create(ll,x,y,seq_bullet_enemy_dark_assault_shotcannon_idle);
}
if(time > 30&&time < 30 + duration){
	if(time mod 20 = 1){
		dd += 1;
		hspd = 1.5;
		blt = MakeEnemyBullet(x+hspeed,y,bullet_enemy_dark_assault_shotcannon_bullet);
		blt.hspeed = -hspd*2;
		blt.image_angle = -8;
		blt.depth -= dd;
		blt = MakeEnemyBullet(x+hspeed,y,bullet_enemy_dark_assault_shotcannon_bullet);
		blt.hspeed = -hspd;
		blt.image_angle = -4;
		blt.depth -= dd;
		blt = MakeEnemyBullet(x+hspeed,y,bullet_enemy_dark_assault_shotcannon_bullet);
		blt = MakeEnemyBullet(x+hspeed,y,bullet_enemy_dark_assault_shotcannon_bullet);
		blt.hspeed = hspd;
		blt.image_angle = 4;
		blt.depth -= dd;
		blt = MakeEnemyBullet(x+hspeed,y,bullet_enemy_dark_assault_shotcannon_bullet);
		blt.hspeed = hspd*2;
		blt.image_angle = 8;
		blt.depth -= dd;
	}
}
if(time = 30 + duration){
	speed = 0;
	layer_sequence_destroy(scseq);
	scseq = layer_sequence_create(ll,x,y,seq_bullet_enemy_dark_assault_shotcannon_outro);
}
if(time = 60 + duration){
	layer_sequence_destroy(scseq);
	destroy_type = 3;
	instance_destroy();
}