live;
depth = DEPTH_BATTLE.ENEMIES
depth_previous = depth

display_mode = ENEMY_DISPLAY_MODE.SPRITE
pre_mode = ENEMY_PRE_MODE.START_FRAME
idle_mode = ENEMY_IDLE_MODE.END_FRAME

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

state = ENEMY_STATE.PRE

bullet_emitter = noone
bullet_emitter_inst = noone

collision_type = COLLISION_TYPE.RECTANGLE
up = 10
down = 10
left = 10
right = 10
mask_sprite = -1

image_angle = 0
image_xscale = 1
image_yscale = 1
blend_r = 255
blend_g = 255
blend_b = 255

inv_damage = true//为真时会被子弹击中但不掉血
inv_collision = false//为真时不会和子弹触发碰撞事件
inv_frozen = false//是否免疫冰冻
inv_burn = false//是否免疫燃烧
hp_max = 5
hp = hp_max
hurt_time = 0
hpbar_enabled = true
hpbar_yoffset = 50
explosion = -1

alarm[0] = 1
event_user(0)

surf_enabled = true
surf = -1
surf_x = 0
surf_y = 0
surf_width = 720
surf_height = 1280

surf_effect = -1
effect_type = 0//0为冰冻 1为灼烧
effect_alpha = 0

layer_enemy = layer_create(depth)
layer_enemy_lower = layer_create(depth+1)
layer_enemy_upper = layer_create(depth-1)

damage = 2

time = 0

mover = function(){}
move_enabled = true

Anim_Create(id,"inv_damage",0,0,1,-1,0,30)

items = []//掉落道具列表，格式为[[[道具0,道具1],权重],[[道具0,道具1],权重]]

last_bullet = noone

tracks = ds_map_create()//被子弹锁定的数量

burn_amount = 0
burn_target = 30
burn_damage = 0
burn_time = 240
burn_duration = -1

explode_amount = 0
explode_target = 70
explode_enabled = false
explode_interval = 45
explode_time = 0
explode_x = x
explode_damage = 1

frozen_amount = 0
frozen_target = 60
frozen_time = 180
frozen_duration = -1
frozen_cd = 0
frozen_cd_time = 120

SpawnFrozenGrid = function(_effect_obj, _tex_sprite, _density = 1, _chance = 1){
	var _w = max(1, bbox_right - bbox_left);
	var _h = max(1, bbox_bottom - bbox_top);
	var _tw = max(1, sprite_exists(_tex_sprite) ? sprite_get_width(_tex_sprite) : 32);
	var _th = max(1, sprite_exists(_tex_sprite) ? sprite_get_height(_tex_sprite) : 32);
	var _cols = max(1, ceil((_w / _tw) * _density));
	var _rows = max(1, ceil((_h / _th) * _density));
	var _cell_w = _w / _cols;
	var _cell_h = _h / _rows;

	for(var gx = 0; gx < _cols; gx += 1){
		for(var gy = 0; gy < _rows; gy += 1){
			if(random(1) <= _chance){
				var _px = bbox_left + (gx + 0.5) * _cell_w + random_range(-_cell_w * 0.25, _cell_w * 0.25);
				var _py = bbox_top + (gy + 0.5) * _cell_h + random_range(-_cell_h * 0.25, _cell_h * 0.25);
				var eff = instance_create_depth(clamp(_px, bbox_left, bbox_right), clamp(_py, bbox_top, bbox_bottom), DEPTH_BATTLE.EFFECTS, _effect_obj);
				eff.sprite_index = _tex_sprite;
				eff.mark = id;
			}
		}
	}
}