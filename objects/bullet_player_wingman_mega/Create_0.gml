live;
event_inherited();

collision_destroy = false

image_speed = 0
start_sprite = spr_bullet_player_mega_a_start
laser_sprite = spr_bullet_player_mega_a

scale_x = 1
scale_y = 1

length = 1500
range = 1500
width = 15
xscale = 1

damage = 0.125

rampage = false
rampage_state = 0//0为正常 1为渐出中

function CollideSingleEnemy(enemy){
	enemy.last_bullet = id;
	event_user(0);
	enemy.Hurt();
}