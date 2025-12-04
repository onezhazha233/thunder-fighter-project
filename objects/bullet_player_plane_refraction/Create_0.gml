live;
event_inherited();

up = 0
down = 0
left = 0
right = 0

collision_destroy = false

laser_sprite = spr_bullet_player_phantom_a
laser_offset = 0
offset_speed = 15

damage = 0.125

range = 1500

fire_image = 0

rampage = false

extra_laser_enabled = true
extra_laser = false
extra_laser_inst = noone

start = true

root_enemy = noone

ignoreInstances = [];

refraction_amount = 3
refraction_amount_valid = 0
refraction_angle = [0,0,0,0,0,0]
refraction_start_x = [x]
refraction_start_y = [y]
refraction_length = [range]