live;
event_inherited()

var scrBegin = function () {
	if (event_number != ev_draw_normal) return;
	gpu_set_blendmode(bm_add);
}

var scrEnd = function () {
	if (event_number != ev_draw_normal) return;
	gpu_set_blendmode(bm_normal)
}

layer_script_begin(global.layer_effects, scrBegin);
layer_script_end(global.layer_effects, scrEnd);

seq = -1

sequence = seq_lightning_a_explosion

alarm[1] = 1

damage = 1
damage_type = 1
damage_interval = 999
collision_destroy = false