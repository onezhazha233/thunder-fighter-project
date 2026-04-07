live;
time += 1

if(time = 30){
	mgseq = layer_sequence_create(ll,x,y,seq_bullet_enemy_umbra_apex_mega_idle);
}
if(time = 31){
	layer_sequence_destroy(mgseq0);
}
if(time = 40 + delay){
	laser = MakeEnemyBullet(x+lengthdir_x(20,image_angle),y+lengthdir_y(20,image_angle),bullet_enemy_umbra_apex_mega_laser);
	laser.laser_duration = duration-34;
}
if(time = 30 + duration + delay){
	speed = 0;
	mgseq0 = layer_sequence_create(ll,x,y,seq_bullet_enemy_umbra_apex_mega_outro);
}
if(time = 30 + duration + delay + 1){
	layer_sequence_destroy(mgseq);
}
if(time = 60 + duration + delay){
	layer_sequence_destroy(mgseq0);
	destroy_type = 3;
	instance_destroy();
}

if(instance_exists(laser)){
	laser.x = x + lengthdir_x(20,image_angle);
	laser.y = y + lengthdir_y(20,image_angle);
	laser.image_angle = image_angle;
}