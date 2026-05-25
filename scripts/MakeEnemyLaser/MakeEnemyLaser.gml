function MakeEnemyLaser(size,xx,yy,col,angle=-90,delay=60,duration=15){
	var obj = bullet_enemy_laser_small
	if(size = 0)obj = bullet_enemy_laser_small;
	if(size = 1)obj = bullet_enemy_laser_medium;
	if(size = 2)obj = bullet_enemy_laser_big;
	var laser = MakeEnemyBullet(xx,yy,obj);
	laser.delay = delay;
	laser.duration = duration;
	laser.image_angle = angle;
	if(col = 0){
		laser.sprite_ball = spr_bullet_enemy_laser_green_ball;
		laser.sprite_ring = spr_bullet_enemy_laser_green_ring;
		laser.sprite_laser_start = spr_bullet_enemy_laser_green_start;
		laser.sprite_laser = spr_bullet_enemy_laser_green;
		laser.sprite_effect = spr_bullet_enemy_effect_laser_green;
	}
	if(col = 1){
		laser.sprite_ball = spr_bullet_enemy_laser_red_ball;
		laser.sprite_ring = spr_bullet_enemy_laser_red_ring;
		laser.sprite_laser_start = spr_bullet_enemy_laser_red_start;
		laser.sprite_laser = spr_bullet_enemy_laser_red;
		laser.sprite_effect = spr_bullet_enemy_effect_laser_red;
	}
	if(col = 2){
		laser.sprite_ball = spr_bullet_enemy_laser_blue_ball;
		laser.sprite_ring = spr_bullet_enemy_laser_blue_ring;
		laser.sprite_laser_start = spr_bullet_enemy_laser_blue_start;
		laser.sprite_laser = spr_bullet_enemy_laser_blue;
		laser.sprite_effect = spr_bullet_enemy_effect_laser_blue;
	}
	
	return laser;
}