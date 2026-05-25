live;
event_inherited()

inv_block = true
auto_destroy = false

damage = 114514*global.enemy_damage_ratio

sprite_ball = spr_bullet_enemy_laser_blue_ball
sprite_ring = spr_bullet_enemy_laser_blue_ring
sprite_laser_start = spr_bullet_enemy_laser_blue_start
sprite_laser = spr_bullet_enemy_laser_blue
sprite_effect = spr_bullet_enemy_effect_laser_blue
sprite_start_effect = spr_bullet_enemy_laser_blue_start_effect

start_effect = true
wave_effect = false

ball_offset = 0
ball_scale_x = 0
ball_scale_y = 0
ball_flash_scale = 0.5
ring_scale = 0
laser_scale = 0
laser_image = 0
wave_offset = 0
wave_xscale = 0
wave_image = 0

for(i=0;i<3;i+=1){
	effect_dir[i] = 0;
	effect_dist[i] = 0;
}

image_angle = -90

state = 0//0为蓄力 1为开始发射 2为发射中 3为发射结束

time = 0

delay = 60
duration = 120

charge_mode = 0//0为正常蓄力 1为无特效蓄力
charge_time = 45//蓄力模式为1时有效

SetState = function(s){
	state = s;
	time = 0;
}