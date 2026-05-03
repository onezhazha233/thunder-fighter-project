live;
event_inherited();

collision_destroy = false

image_speed = 0
start_sprite = spr_bullet_player_mega_b_start
laser_sprite = spr_bullet_player_mega_b

scale_x = 1
scale_y = 1

length = 1500
range = 1500
width = 15*1.1

damage = 0.125

rampage = false
rampage_state = 0

function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
}