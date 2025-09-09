plane_sequence = -1

idle_mode = 0//0为贴图 1为序列 2为暴走第一帧
idle_sprite = -1
idle_sequence = -1

flame_upper_enabled = 0//是否有上层尾焰
flame_upper = -1
flame_upper_sequence = -1
flame_upper_x_offset = 0
flame_upper_y_offset = 0

flame_lower_enabled = 0//是否有下层尾焰
flame_lower = -1
flame_lower_sequence = -1
flame_lower_x_offset = 0
flame_lower_y_offset = 0

rampage_intro = -1
rampage = -1
rampage_outro_mode = 0//0为存在暴走结束动画 1为暴走开始动画倒放
rampage_outro = -1

draw_plane = 0

bullet_emitter = noone
bullet_emitter_inst = noone

state = 0//0为正常 1为暴走开始 2为暴走中 3为暴走结束

image_angle = 0
image_xscale = 1
image_yscale = 1

alarm[0] = 1
event_user(0)

surf_enabled = false
surf = -1;
surf_x = 0
surf_y = 720
surf_width = 720
surf_height = 300

layer_plane = layer_create(depth)
layer_plane_lower = layer_create(depth+1)
layer_plane_upper = layer_create(depth-1)

speed_x = 0

roll_state = 0;// 侧翻状态：-3到3（0为水平，负为左翻，正为右翻）

// 侧翻贴图设置
sprite_roll_left = -1;  // 左翻贴图（3帧：轻微、中等、完全）
sprite_roll_right = -1; // 右翻贴图（3帧：轻微、中等、完全）
sprite_roll_flip = false//是否使用左倾贴图翻转作为右倾贴图

// 常量定义
ROLL_THRESHOLD = 3;   // 开始侧翻的速度阈值
MAX_ROLL_SPEED = 30;  // 最大侧翻速度
ROLL_CHANGE_SPEED = 0.6; // 侧翻状态变化速度