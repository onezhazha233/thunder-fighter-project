live;
event_inherited();

collision_destroy = false
auto_destroy = false

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

bullet_sequence = -1
sequence = seq_bullet_player_falcon_a_fire

width = 60
range = 500
rampage = false

SetSequence = function(seq){
	sequence = seq;
	layer_sequence_destroy(bullet_sequence);
	bullet_sequence = layer_sequence_create(ll,0,0,seq);
}

time = 0
draw_effect = function(_x, _y, _scale, _time){
    var _length = 14.0;
    var _t = clamp(_time, 0, _length);
    
    if (_t <= 6.0) {
        var _img_idx = 0;
        if (_t >= 2.0) _img_idx = 1;
        if (_t >= 4.0) _img_idx = 2;
        if (_t >= 6.0) _img_idx = 3;
		var _scl2 = lerp(1.2, 1.4, clamp(_t / 6.0, 0, 1))*(rampage/2+1);
        var _scl2y = lerp(1.0, 1.5, clamp(_t / 6.0, 0, 1))*(rampage/2+1);
        var _col1 = merge_color(make_color_rgb(255,255,128), make_color_rgb(255,128,200), _t / 6.0);
        draw_sprite_ext(spr_bullet_effect_falcon, _img_idx, _x, _y, _scale * _scl2, _scale * _scl2y, 0, _col1, 1.0);
    }
    
    if (_t >= 6.0) {
        var _t2 = _t - 6.0;
        var _img_idx2 = 3;
        if (_t2 >= 2.0) _img_idx2 = 1;
        if (_t2 >= 4.0) _img_idx2 = 2;
        if (_t2 >= 6) _img_idx2 = 3;
        var _scl2 = lerp(1.2, 1.4, clamp(_t2 / 8.0, 0, 1))*(rampage/2+1);
        var _scl2y = lerp(1.0, 1.5, clamp(_t2 / 8.0, 0, 1))*(rampage/2+1);
        var _col2 = merge_color(make_color_rgb(255,128,200), make_color_rgb(255,255,128), clamp(_t2 / 8.0, 0, 1));
        draw_sprite_ext(spr_bullet_effect_falcon, _img_idx2, _x, _y, _scale * _scl2, _scale * _scl2y, 0, _col2, 1.0);
    }
	var _ring_scl = lerp(0.5, 1.5, clamp(_t / 8.0, 0, 1))*(rampage/2+1);
	if(_t <= 8){
		var _ring_alpha = 1;
		if(_t >= 4){
			_ring_alpha = 1 - (_t-4)/4;
		}
		draw_sprite_ext(spr_bullet_effect_falcon_ring, 0, _x, _y, _scale * _ring_scl, _scale * _ring_scl, 0, -1, _ring_alpha);
	}
	if(rampage = true){
		var _scl1 = clamp(_time, 0, 10.0);
	    var _alpha1 = 1.0;
	    if (_scl1 > 4.0) {
	        _alpha1 = 1.0 - ((_scl1 - 4.0) / 6.0);
	    }
	    if (_alpha1 > 0) {
	        var _sx1 = lerp(0.8, 1.5, _scl1 / 10.0);
	        var _sy1 = lerp(0.0, 1.2, _scl1 / 10.0);
	        draw_sprite_ext(spr_bullet_effect_falcon_particle_1, 0, _x, _y, _scale * _sx1, _scale * _sy1, -50, c_white, _alpha1);
	    }
    
	    var _t2 = _time - 2.0;
	    if (_t2 >= 0) {
	        var _scl2 = clamp(_t2, 0, 10.0);
	        var _alpha2 = 1.0;
	        if (_scl2 > 4.0) {
	            _alpha2 = 1.0 - ((_scl2 - 4.0) / 6.0);
	        }
	        if (_alpha2 > 0) {
	            var _sx2 = lerp(0.8, 2.0, _scl2 / 10.0);
	            var _sy2 = lerp(0.0, 1.5, _scl2 / 10.0);
	            draw_sprite_ext(spr_bullet_effect_falcon_particle_0, 0, _x, _y, _scale * _sx2, _scale * _sy2, 50, c_white, _alpha2);
	        }
	    }
	}
}