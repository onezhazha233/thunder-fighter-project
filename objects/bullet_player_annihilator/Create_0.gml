live;
event_inherited();

image_speed = 0
tail_scale = 0
tail_image = 1

Anim_Create(id,"tail_scale",0,0,0,2.5,15,15)

collision_type = COLLISION_TYPE.SPRITE

track_inst = noone
track_inst_exists = 1

rampage = false

damage = 1

turn_speed = 1;
max_turn = 10;
accel = 2;
max_accel = 10
max_speed = 75;
turn_timer = 40;

target_x = player.x;
target_y = player.y-800;

target_x_previous = target_x
target_y_previous = target_y

pass_target = 0

baseDirSpd = 0.01;
dirSpd = baseDirSpd;

bestDis = 100;