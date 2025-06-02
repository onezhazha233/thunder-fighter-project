live;
depth = DEPTH_BATTLE.BULLETS_PLAYER
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

alarm[0] = 1