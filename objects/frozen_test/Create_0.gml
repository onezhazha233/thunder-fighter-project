live;
image_xscale = 4
image_yscale = 2

surf_enabled = true
surf = -1
surf_effect = -1
surf_x = 0
surf_y = 0
surf_width = 720
surf_height = 1280

effect_alpha = 0

frozen_amount = 0
frozen_target = 60
frozen_time = 600
frozen_duration = -1
frozen_cd = 0
frozen_cd_time = 120

SpawnFrozenGrid = function(_effect_obj, _tex_sprite, _density = 1, _chance = 1){
	var _w = max(1, bbox_right - bbox_left);
	var _h = max(1, bbox_bottom - bbox_top);
	var _tw = max(1, sprite_exists(_tex_sprite) ? sprite_get_width(_tex_sprite) : 32);
	var _th = max(1, sprite_exists(_tex_sprite) ? sprite_get_height(_tex_sprite) : 32);
	var _cols = max(1, ceil((_w / _tw) * _density));
	var _rows = max(1, ceil((_h / _th) * _density));
	var _cell_w = _w / _cols;
	var _cell_h = _h / _rows;

	for(var gx = 0; gx < _cols; gx += 1){
		for(var gy = 0; gy < _rows; gy += 1){
			if(random(1) <= _chance){
				var _px = bbox_left + (gx + 0.5) * _cell_w + random_range(-_cell_w * 0.25, _cell_w * 0.25);
				var _py = bbox_top + (gy + 0.5) * _cell_h + random_range(-_cell_h * 0.25, _cell_h * 0.25);
				instance_create_depth(clamp(_px, bbox_left, bbox_right), clamp(_py, bbox_top, bbox_bottom), DEPTH_BATTLE.EFFECTS, _effect_obj).sprite_index = _tex_sprite;
			}
		}
	}
}

SetFrozen = function(f){
	frozen_duration = f;
	if(f > 0){
		effect_alpha = 0.5;
		SpawnFrozenGrid(effect_enemy_ice, spr_effect_enemy_ice, 0.8, 1);
		SpawnFrozenGrid(effect_enemy_snowflake_fog, spr_effect_enemy_fog, 0.8, 1);
	}
	else{
		frozen_duration = -1;
		effect_alpha = 0;
		frozen_cd = frozen_cd_time;
	}
}
