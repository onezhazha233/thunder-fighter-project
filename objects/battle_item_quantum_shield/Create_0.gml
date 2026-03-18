live;
event_inherited();

ll = layer_create(depth)
ll_fx = layer_create(depth - 1)

bg_sequence = layer_sequence_create(ll,x,y,seq_battle_item_ring)
item_sequence = layer_sequence_create(ll,x,y,seq_battle_item_quantum_shield)
effect_sequence = -1

direction = random(360)
speed = random_range(3,6)

duration = -1//临时道具为510

var scrBegin = function(){
	if (event_number != ev_draw_normal) return;
	gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
	shader_set(shd_blend_alpha);
	shader_set_uniform_f(shader_get_uniform(shd_blend_alpha,"u_blendColor"),1,1,1,image_alpha);
}

var scrEnd = function(){
	if (event_number != ev_draw_normal) return;
	shader_reset();
	gpu_set_blendmode(bm_normal);
}
layer_script_begin(ll, scrBegin);
layer_script_end(ll, scrEnd);
layer_script_begin(ll_fx, scrBegin);
layer_script_end(ll_fx, scrEnd);

SetDuration = function(d){
	duration = d;
	effect_sequence = layer_sequence_create(ll_fx,x,y,seq_battle_item_temp_effect);
}