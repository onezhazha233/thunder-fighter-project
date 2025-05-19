live;
depth = -50
sl = layer_create(-50)
shield_sequence = layer_sequence_create(sl,x,y,seq_battle_quantum_shield)
duration = global.quantum_shield_duration
global.inv_shield = 1

fade = 0
fade_time = 0

range = 75
shield_range = 55

image_xscale = 0.7
image_yscale = 0.7

Anim_Create(id,"shield_range",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,shield_range,range-shield_range,10)
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_xscale,1-image_xscale,10)
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_yscale,1-image_yscale,10)

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
layer_script_begin(sl, scrBegin);
layer_script_end(sl, scrEnd);

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	if(layer_sequence_exists(sl,shield_sequence)){
		layer_sequence_x(shield_sequence,x);
		layer_sequence_y(shield_sequence,y);
		layer_sequence_xscale(shield_sequence,image_xscale);
		layer_sequence_yscale(shield_sequence,image_yscale);
	}
}