live;
event_inherited();

up = 0
down = 0
left = 0
right = 0

collision_destroy = false

laser_sprite = spr_bullet_player_blade_abcd_line
laser_offset = 0
offset_speed = 7

range = 1500

rampage = false

layer_edge = layer_create(-1)
var scrBegin = function () {
	if (event_number != ev_draw_normal) return;
	gpu_set_blendmode(bm_add);
}

var scrEnd = function () {
	if (event_number != ev_draw_normal) return;
	gpu_set_blendmode(bm_normal)
}

layer_script_begin(layer_edge, scrBegin);
layer_script_end(layer_edge, scrEnd);

x_offset = 0
y_offset = 0
edge_sequence_enabled = true
edge_attack_sequence_enabled = true
edge_x = x
edge_y = y
edge_sequence = -1
edge_state = 0//0为冷却中 1为刀刃准备中 2为刀刃准备攻击
edge_cdd = 45
edge_cd = edge_cdd
edge_attack_sequence = -1
edge_xscale = [0.95,0.87,0.7]

slash_x = 0
slash_y = 0

slash_damage = 1