live;
ll = layer_create(depth)
var scrBegin = function () {
	if (event_number != ev_draw_normal) return;
	gpu_set_blendmode(bm_add);
}

var scrEnd = function () {
	if (event_number != ev_draw_normal) return;
	gpu_set_blendmode(bm_normal)
}

layer_script_begin(ll, scrBegin);
layer_script_end(ll, scrEnd);

bullet_sequence = layer_sequence_create(ll,x,y,bullet_sequence)
layer_sequence_xscale(bullet_sequence,image_xscale)
layer_sequence_yscale(bullet_sequence,image_yscale)
layer_sequence_angle(bullet_sequence,image_angle)
enabled = true