live;
var scrBegin = function () {
	if (event_number != ev_draw_normal) return;
	gpu_set_blendmode(bm_add);
}

var scrEnd = function () {
	if (event_number != ev_draw_normal) return;
	gpu_set_blendmode(bm_normal)
}

layer_script_begin("effects", scrBegin);
layer_script_end("effects", scrEnd);

seq = -1

sequence = seq_bullet_effect_lightning_a

alarm[0] = 1