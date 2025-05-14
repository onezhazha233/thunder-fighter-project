live;
depth = DEPTH_BATTLE.ENEMIES
depth_previous = depth

display_mode = DISPLAY_MODE.SPRITE
pre_mode = PRE_MODE.START_FRAME
idle_mode = IDLE_MODE.END_FRAME

enemy_sequence = -1
enemy_sprite = -1

pre_sequence = -1
intro_sequence = -1
idle_sequence = -1

flame_lower = -1//-1为无尾焰
flame_lower_sequence = -1
flame_lower_x_offset = 0
flame_lower_y_offset = 0

flame_upper = -1//-1为无尾焰
flame_upper_sequence = -1
flame_upper_x_offset = 0
flame_upper_y_offset = 0

state = ENEMY_STAT.PRE

bullet_emitter = noone
bullet_emitter_inst = noone

collision_type = 0//0为矩形 1为贴图
up = 10
down = 10
left = 10
right = 10

image_angle = 0
image_xscale = 1
image_yscale = 1
blend_r = 255
blend_g = 255
blend_b = 255

inv_damage = false//为真时会被子弹击中但不掉血
inv_collision = false//为真时不会和子弹触发碰撞事件
hp_max = 5
hp = hp_max
hurt_time = 0
hpbar_enabled = true
hpbar_yoffset = 50
explosion = -1

alarm[0] = 1
event_user(1)

surf_enabled = false
surf = -1;
surf_x = 0
surf_y = 200
surf_width = 720
surf_height = 500

//le = "enemies"
//lel = "enemies_lower"
layer_enemy = layer_create(depth)
layer_enemy_lower = layer_create(depth+1)
layer_enemy_upper = layer_create(depth-1)
le = layer_enemy
lel = layer_enemy_lower
leu = layer_enemy_upper

damage = 2

time = 0

mover = function(){}