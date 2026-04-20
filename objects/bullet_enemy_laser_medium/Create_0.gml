live;
event_inherited()

inv_block = false

damage = 2*global.enemy_damage_ratio

sprite_ball = spr_bullet_enemy_laser_green_ball
sprite_ring = spr_bullet_enemy_laser_green_ring
sprite_laser_start = spr_bullet_enemy_laser_green_start
sprite_laser = spr_bullet_enemy_laser_green
sprite_effect = spr_bullet_enemy_effect_laser_green

ball_offset = 0
ball_scale_x = 0
ball_scale_y = 0
ball_flash_scale = 0.5
ring_scale = 0
laser_scale = 1.5
laser_image = 1

for(i=0;i<3;i+=1){
	effect_dir[i] = 0;
	effect_dist[i] = 0;
}

image_angle = -90

state = 0//0为蓄力 1为开始发射 2为发射中 3为发射结束

time = 0

delay = 60
duration = 15

SetState = function(s){
	state = s;
	time = 0;
}