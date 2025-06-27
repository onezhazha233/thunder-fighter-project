live;
event_inherited();

up = 1500
left = 0.5
right = 0.5
down = 0

collision_destroy = false

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

damage = 1