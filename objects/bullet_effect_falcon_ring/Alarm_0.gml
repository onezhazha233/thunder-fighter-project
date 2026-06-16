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

seq = layer_sequence_create(ll,x,y,sequence)
layer_sequence_xscale(seq,image_xscale)
layer_sequence_yscale(seq,image_yscale)
enabled = true