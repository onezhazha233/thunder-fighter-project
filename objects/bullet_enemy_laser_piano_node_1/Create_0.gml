live;
event_inherited()

state = 0//0为警告中 1为警告消失 2为节点出现 3为节点存在中 4为节点消失
mark = 0
time = 0

accept_laser = 0
delay = 30
duration = -1

ring_scale = 5
ring_alpha = 0
ring_angle = 0
ring_logo_scale = 1
ring_logo_alpha = 0

node_0_scale = 1
node_0_alpha = 0
node_1_scale = 1.5
node_1_alpha = 0
node_part = 1
node_bottom_dist = 0
node_trangle_0_alpha = 0
node_trangle_1_alpha = 1
node_trangle_1_scale = 0
redlight_scale = 0
redlight_alpha = 0

auto_destroy = false
inv_block = true
collision_destroy = false
collision_enabled = false

blk = noone

if!(instance_exists(bullet_enemy_laser_piano_node_upper)){
	instance_create_depth(0,0,0,bullet_enemy_laser_piano_node_upper);
}

alarm[0] = 1