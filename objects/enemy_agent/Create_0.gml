live;
depth = DEPTH_BATTLE.ENEMIES

display_mode = 0//0为纯贴图 1为纯序列
pre_mode = 0//0为展开序列第一帧 1为序列
idle_mode = 0//0为展开序列最后一帧 1为序列

enemy_sequence = -1
enemy_sprite = -1

pre_sequence = -1
intro_sequence = -1
idle_sequence = -1

flame = -1//-1为无尾焰
flame_sequence = -1
flame_x_offset = 0
flame_y_offset = 0

state = 0//0为未展开 1为展开中 2为已展开 3为收回

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

hp_max = 5
hp = hp_max
hurt_time = 0
hpbar_yoffset = 50
explosion = -1

alarm[0] = 1
event_user(1)

surf_enabled = false
surf = -1;
surf_x = 50
surf_y = 50
surf_width = 800
surf_height = 600

damage = 2