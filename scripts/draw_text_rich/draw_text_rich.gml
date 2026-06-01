function draw_text_rich(_x0, _y0, _text, _font=Lang_GetFont("zpix"), _visible_count=-1, _line_space=24, _char_space=0, _halign=fa_left, _valign=fa_top, _ui_scale_x=1.0, _ui_scale_y=1.0, _base_alpha=1.0) {
	if (_base_alpha <= 0 || _ui_scale_x <= 0 || _ui_scale_y <= 0 || _visible_count == 0) return;

	var _old_font = draw_get_font();
	draw_set_font(_font);

	var _def_color = draw_get_color();
	var _curr_color = _def_color;
	var _curr_scale = 1.0;
	var _curr_effect = 0;
	
	// === 新增：描边状态变量 ===
	var _curr_out_color = c_black;
	var _curr_out_thick = 0; // 0 表示无描边
	
	var _visible_drawn = 0;
	var _limit_visible = (_visible_count > 0);

	var _lines = [];
	var _curr_line = [];
	var _len = string_length(_text);
	var _i = 1;
	var _global_char_index = 0;
	var _stop_parsing = false;

	// 辅助方法：用于复用颜色解析逻辑
	var _parse_color_name = function(_name) {
		if (_name == "aqua")		 return c_aqua;
		if (_name == "black")   return c_black;
		if (_name == "blue")    return c_blue;
		if (_name == "dkgray" || _name == "dkgrey") return c_dkgray;
		if (_name == "fuchsia") return c_fuchsia;
		if (_name == "gray" || _name == "grey")   return c_gray;
		if (_name == "green")   return c_green;
		if (_name == "lime")    return c_lime;
		if (_name == "ltgray" || _name == "ltgrey") return c_ltgray;
		if (_name == "maroon")  return c_maroon;
		if (_name == "navy")    return c_navy;
		if (_name == "olive")   return c_olive;
		if (_name == "orange")  return c_orange;
		if (_name == "purple")  return c_purple;
		if (_name == "red")     return c_red;
		if (_name == "silver")  return c_silver;
		if (_name == "teal")    return c_teal;
		if (_name == "white")   return c_white;
		if (_name == "yellow")  return c_yellow;
		return c_white;
	};

	while (_i <= _len && !_stop_parsing) {
		var _char = string_char_at(_text, _i);

		if (_char == "{") {
			var _close_pos = string_pos_ext("}", _text, _i);
			if (_close_pos > 0) {
				var _tag = string_copy(_text, _i + 1, _close_pos - _i - 1);
				_i = _close_pos + 1;

				if (_tag == "-") {
					_curr_color = _def_color;
					_curr_scale = 1.0;
					_curr_effect = 0;
					_curr_out_thick = 0; // 恢复默认无描边
				}
				else if (string_starts_with(_tag, "color_rgb ")) {
					var _rgb_str = string_delete(_tag, 1, 10);
					var _rgb_arr = string_split(_rgb_str, " ", true); 
					if (array_length(_rgb_arr) >= 3) {
						_curr_color = make_color_rgb(real(_rgb_arr[0]), real(_rgb_arr[1]), real(_rgb_arr[2]));
					}
				}
				else if (string_starts_with(_tag, "color ")) {
					var _col_name = string_delete(_tag, 1, 6);
					_curr_color = _parse_color_name(_col_name);
				}
				// === 新增：解析描边颜色 (支持 outline_color 255 255 255 或 outline_color red) ===
				else if (string_starts_with(_tag, "outline_color ")) {
					var _out_str = string_delete(_tag, 1, 14);
					var _out_arr = string_split(_out_str, " ", true);
					if (array_length(_out_arr) >= 3) {
						_curr_out_color = make_color_rgb(real(_out_arr[0]), real(_out_arr[1]), real(_out_arr[2]));
					} else {
						_curr_out_color = _parse_color_name(_out_str);
					}
				}
				// === 新增：解析描边厚度 (outline_thickness 2) ===
				else if (string_starts_with(_tag, "outline_thickness ")) {
					_curr_out_thick = real(string_delete(_tag, 1, 18));
				}
				else if (string_starts_with(_tag, "scale ")) {
					_curr_scale = real(string_delete(_tag, 1, 6));
				}
				else if (string_starts_with(_tag, "effect ")) {
					var _eff_type = string_delete(_tag, 1, 7);
					if (_eff_type == "0" || _eff_type == "normal") _curr_effect = 0;
					else if (_eff_type == "1" || _eff_type == "shake")  _curr_effect = 1;
					else if (_eff_type == "2" || _eff_type == "wave")   _curr_effect = 2;
				}
				continue;
			}
		}

		if (_char == "\n") {
			array_push(_lines, _curr_line);
			_curr_line = [];
			_i += 1;
			continue;
		}

		var _char_w = string_width(_char) * _curr_scale * _ui_scale_x;
		array_push(_curr_line, {
			char: _char,
			color: _curr_color,
			scale: _curr_scale,
			effect: _curr_effect,
			width: _char_w,
			index: _global_char_index,
			// === 存储每个字符的描边信息 ===
			out_color: _curr_out_color,
			out_thick: _curr_out_thick
		});

		_global_char_index += 1;
		_visible_drawn += 1;
		if (_limit_visible && _visible_drawn >= _visible_count) {
			_stop_parsing = true;
		}
		_i += 1;
	}

	array_push(_lines, _curr_line);

	var _line_count = array_length(_lines);
	var _real_line_space = _line_space * _ui_scale_y;
	var _real_char_space = _char_space * _ui_scale_x;
	var _text_block_total_height = _line_count * _real_line_space;

	var _start_y = _y0;
	if (_valign == fa_middle) {
		_start_y = _y0 - (_text_block_total_height / 2) + (_real_line_space / 4);
	}
	else if (_valign == fa_bottom) {
		_start_y = _y0 - _text_block_total_height + (_real_line_space / 2);
	}

	var _draw_y = _start_y;
	var _time = current_time * 0.005;

	for (var _l = 0; _l < _line_count; _l++) {
		var _line_data = _lines[_l];
		var _char_count = array_length(_line_data);
		if (_char_count == 0) {
			_draw_y += _real_line_space;
			continue;
		}

		var _line_total_width = 0;
		for (var _c = 0; _c < _char_count; _c++) {
			_line_total_width += _line_data[_c].width;
			if (_c < _char_count - 1) _line_total_width += _real_char_space;
		}

		var _draw_x = _x0;
		if (_halign == fa_center)      _draw_x = _x0 - (_line_total_width / 2);
		else if (_halign == fa_right)  _draw_x = _x0 - _line_total_width;

		for (var _c = 0; _c < _char_count; _c++) {
			var _data = _line_data[_c];
			var _offset_x = 0;
			var _offset_y = 0;

			switch (_data.effect) {
				case 1:
					_offset_x = random_range(-1.5, 1.5) * _data.scale * _ui_scale_x;
					_offset_y = random_range(-1.5, 1.5) * _data.scale * _ui_scale_y;
					break;
				case 2:
					_offset_y = sin(_time + (_data.index * 0.5)) * 4.0 * _data.scale * _ui_scale_y;
					break;
			}

			var _final_x = _draw_x + _offset_x;
			var _final_y = _draw_y + _offset_y;
			var _sc_x = _data.scale * _ui_scale_x;
			var _sc_y = _data.scale * _ui_scale_y;

			// === 新增：核心 8 方向描边绘制逻辑 ===
			if (_data.out_thick > 0) {
				var _t = _data.out_thick;
				// 8 个方向的相对坐标偏移数组
				var _dx = [-_t,  0,  _t, -_t, _t, -_t, 0, _t];
				var _dy = [-_t, -_t, -_t,  0,  0,  _t, _t, _t];
				
				for (var _d = 0; _d < 8; _d++) {
					draw_text_transformed_color(
						_final_x + _dx[_d], 
						_final_y + _dy[_d], 
						_data.char, _sc_x, _sc_y, 0, 
						_data.out_color, _data.out_color, _data.out_color, _data.out_color, 
						_base_alpha
					);
				}
			}

			// 绘制主体文本（叠在描边上方）
			draw_text_transformed_color(
				_final_x,
				_final_y,
				_data.char, _sc_x, _sc_y, 0,
				_data.color, _data.color, _data.color, _data.color,
				_base_alpha
			);

			_draw_x += _data.width + _real_char_space;
		}

		_draw_y += _real_line_space;
	}

	draw_set_font(_old_font);
}