live;
ll = layer_create(depth)
surf = surface_create(room_width,room_height)
var scrBegin = function(){
	if (event_number != ev_draw_normal) return;
	surface_set_target(surf);
	gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
}

var scrEnd = function(){
	if (event_number != ev_draw_normal) return;
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}
layer_script_begin(ll, scrBegin);
layer_script_end(ll, scrEnd);