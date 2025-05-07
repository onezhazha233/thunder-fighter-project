wingman_sequence = -1

idle_mode = 0//0为贴图 1为序列 2为暴走第一帧
idle_sprite = -1
idle_sequence = -1

flame = -1//-1为无尾焰
flame_sequence = -1
flame_x_offset = 0
flame_y_offset = 0

rampage_intro = -1
rampage = -1
rampage_outro_mode = 0//0为存在暴走结束动画 1为暴走开始动画倒放
rampage_outro = -1

draw_wingman = 0

bullet_emitter = noone
bullet_emitter_inst = noone

state = 0//0为正常 1为暴走开始 2为暴走中 3为暴走结束

image_angle = 0
image_xscale = 1
image_yscale = 1
flip = 0

alarm[0] = 1
event_user(0)

surf_enabled = 0
surf = -1;
surf_x = 50
surf_y = 50
surf_width = 800
surf_height = 600