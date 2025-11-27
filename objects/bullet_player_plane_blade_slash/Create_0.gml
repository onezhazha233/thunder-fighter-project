live;
depth = DEPTH_BATTLE.BULLETS_PLAYER - 10
l = layer_create(depth)
var scrBegin = function () {
	if (event_number != ev_draw_normal) return;
	gpu_set_blendmode(bm_add);
}

var scrEnd = function () {
	if (event_number != ev_draw_normal) return;
	gpu_set_blendmode(bm_normal)
}

layer_script_begin(l, scrBegin);
layer_script_end(l, scrEnd);

seq = -1
slash_sequence = seq_bullet_player_blade_a_slash
slash_rampage_sequence = seq_bullet_player_blade_a_slash_rampage
point_sprite = spr_bullet_player_blade_a_slash_point

rampage = false

damage = 1

alarm[0] = 1