/// RichTextLayout - 富文本布局缓存
/// 将draw_text_rich的解析(昂贵)与绘制(廉价)分离
/// 文本/字体/间距等不变时复用缓存的布局数据
/// UI缩放(abs_scale_x/y)变化不会导致缓存失效
function RichTextLayout() constructor {
    // 输入参数（外部可直接赋值，赋值后需调用 Invalidate()）
    text = "";
    font = -1;
    line_space = 24;
    char_space = 0;
    halign = fa_left;
    valign = fa_top;
    per_line_align = false;

    // ====== 内部缓存 ======
    _cached = false;
    __lines = [];           // 每行是字符结构数组
    __max_line_width = 0;   // base scale 下的最大行宽
    __line_count = 0;
    __text_block_height = 0;// base scale 下的文本块高度
    __def_color = c_white;

    /// 标记缓存失效，参数变化时调用
    static Invalidate = function() {
        _cached = false;
        __lines = [];
    }

    /// 内部：重建缓存（从 draw_text_rich 提取的解析逻辑）
    static _Build = function() {
        var _text = text;
        var _font = font;
        var _line_space = line_space;
        var _char_space = char_space;

        __lines = [];

        var _old_font = draw_get_font();
        draw_set_font(_font);

        __def_color = draw_get_color();
        var _curr_color = __def_color;
        var _curr_scale_x = 1.0;
        var _curr_scale_y = 1.0;
        var _curr_effect = 0;
        var _curr_out_color = c_black;
        var _curr_out_thick = 0;

        var _len = string_length(_text);
        var _i = 1;
        var _global_char_index = 0;

        var _parse_color_name = function(_name) {
            if (_name == "aqua")        return c_aqua;
            if (_name == "black")       return c_black;
            if (_name == "blue")        return c_blue;
            if (_name == "dkgray" || _name == "dkgrey") return c_dkgray;
            if (_name == "fuchsia")     return c_fuchsia;
            if (_name == "gray" || _name == "grey")     return c_gray;
            if (_name == "green")       return c_green;
            if (_name == "lime")        return c_lime;
            if (_name == "ltgray" || _name == "ltgrey") return c_ltgray;
            if (_name == "maroon")      return c_maroon;
            if (_name == "navy")        return c_navy;
            if (_name == "olive")       return c_olive;
            if (_name == "orange")      return c_orange;
            if (_name == "purple")      return c_purple;
            if (_name == "red")         return c_red;
            if (_name == "silver")      return c_silver;
            if (_name == "teal")        return c_teal;
            if (_name == "white")       return c_white;
            if (_name == "yellow")      return c_yellow;
            return c_white;
        };

        var _curr_line = [];

        while (_i <= _len) {
            var _char = string_char_at(_text, _i);

            if (_char == "{") {
                var _close_pos = string_pos_ext("}", _text, _i);
                if (_close_pos > 0) {
                    var _tag = string_copy(_text, _i + 1, _close_pos - _i - 1);
                    _i = _close_pos + 1;

                    if (_tag == "-") {
                        _curr_color = __def_color;
                        _curr_scale_x = 1.0;
                        _curr_scale_y = 1.0;
                        _curr_effect = 0;
                        _curr_out_thick = 0;
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
                    else if (string_starts_with(_tag, "outline_color ")) {
                        var _out_str = string_delete(_tag, 1, 14);
                        var _out_arr = string_split(_out_str, " ", true);
                        if (array_length(_out_arr) >= 3) {
                            _curr_out_color = make_color_rgb(real(_out_arr[0]), real(_out_arr[1]), real(_out_arr[2]));
                        } else {
                            _curr_out_color = _parse_color_name(_out_str);
                        }
                    }
                    else if (string_starts_with(_tag, "outline_thickness ")) {
                        _curr_out_thick = real(string_delete(_tag, 1, 18));
                    }
                    else if (string_starts_with(_tag, "scale ")) {
                        var _val = real(string_delete(_tag, 1, 6));
                        _curr_scale_x = _val;
                        _curr_scale_y = _val;
                    }
                    else if (string_starts_with(_tag, "scale_x ")) {
                        _curr_scale_x = real(string_delete(_tag, 1, 8));
                    }
                    else if (string_starts_with(_tag, "scale_y ")) {
                        _curr_scale_y = real(string_delete(_tag, 1, 8));
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
                array_push(__lines, _curr_line);
                _curr_line = [];
                _i += 1;
                continue;
            }

            // 关键：不预乘 _ui_scale_x，使缓存与 UI 缩放无关
            var _char_w_base = string_width(_char) * _curr_scale_x;
            array_push(_curr_line, {
                char: _char,
                color: _curr_color,
                scale_x: _curr_scale_x,
                scale_y: _curr_scale_y,
                effect: _curr_effect,
                width_base: _char_w_base,
                index: _global_char_index,
                out_color: _curr_out_color,
                out_thick: _curr_out_thick
            });

            _global_char_index += 1;
            _i += 1;
        }

        array_push(__lines, _curr_line);
        draw_set_font(_old_font);

        __line_count = array_length(__lines);
        __max_line_width = 0;

        // 计算 base scale 下的最大行宽
        for (var _l = 0; _l < __line_count; _l++) {
            var _ld = __lines[_l];
            var _cc = array_length(_ld);
            var _tw = 0;
            for (var _c = 0; _c < _cc; _c++) {
                _tw += _ld[_c].width_base;
                if (_c < _cc - 1) _tw += _char_space;
            }
            if (_tw > __max_line_width) __max_line_width = _tw;
        }

        __text_block_height = __line_count * _line_space;
        _cached = true;
    }

    /// 确保缓存有效
    static _EnsureBuilt = function() {
        if (!_cached) _Build();
    }

    /// 从缓存绘制（性能关键路径，微优化：内联计算）
    static Draw = function(_x0, _y0, _base_alpha=1.0, _visible_count=-1, _ui_scale_x=1.0, _ui_scale_y=1.0) {
        if (_base_alpha <= 0 || _ui_scale_x <= 0 || _ui_scale_y <= 0 || _visible_count == 0) return;
        _EnsureBuilt();

        var _old_font = draw_get_font();
        draw_set_font(font);

        var _limit_visible = (_visible_count > 0);
        var _visible_drawn = 0;
        var _real_line_space = line_space * _ui_scale_y;
        var _real_char_space = char_space * _ui_scale_x;
        var _total_h = __line_count * _real_line_space;

        var _start_y = _y0;
        if (valign == fa_middle) {
            _start_y = _y0 - (_total_h / 2) + (_real_line_space / 4);
        }
        else if (valign == fa_bottom) {
            _start_y = _y0 - _total_h + (_real_line_space / 2);
        }

        var _draw_y = _start_y;
        var _time = current_time * 0.005;
        var _max_lw_scaled = __max_line_width * _ui_scale_x;

        for (var _l = 0; _l < __line_count; _l++) {
            if (_limit_visible && _visible_drawn >= _visible_count) break;

            var _line_data = __lines[_l];
            var _char_count = array_length(_line_data);
            if (_char_count == 0) {
                _draw_y += _real_line_space;
                continue;
            }

            // 计算本行缩放后宽度
            var _line_w = 0;
            for (var _c = 0; _c < _char_count; _c++) {
                _line_w += _line_data[_c].width_base * _ui_scale_x;
                if (_c < _char_count - 1) _line_w += _real_char_space;
            }

            var _draw_x = _x0;
            if (halign == fa_center) {
                if (per_line_align) {
                    _draw_x = _x0 + (_max_lw_scaled - _line_w) / 2;
                } else {
                    _draw_x = _x0 - (_line_w / 2);
                }
            } else if (halign == fa_right) {
                if (per_line_align) {
                    _draw_x = _x0 + _max_lw_scaled - _line_w;
                } else {
                    _draw_x = _x0 - _line_w;
                }
            }

            for (var _c = 0; _c < _char_count; _c++) {
                if (_limit_visible && _visible_drawn >= _visible_count) break;

                var _data = _line_data[_c];
                var _off_x = 0;
                var _off_y = 0;

                switch (_data.effect) {
                    case 1:
                        _off_x = random_range(-1.5, 1.5) * _data.scale_x * _ui_scale_x;
                        _off_y = random_range(-1.5, 1.5) * _data.scale_y * _ui_scale_y;
                        break;
                    case 2:
                        _off_y = sin(_time + (_data.index * 0.5)) * 4.0 * _data.scale_y * _ui_scale_y;
                        break;
                }

                var _fx = _draw_x + _off_x;
                var _fy = _draw_y + _off_y;
                var _sx = _data.scale_x * _ui_scale_x;
                var _sy = _data.scale_y * _ui_scale_y;

                if (_data.out_thick > 0) {
                    var _t = _data.out_thick;
                    var _dx = [-_t,  0,  _t, -_t, _t, -_t, 0, _t];
                    var _dy = [-_t, -_t, -_t,  0,  0,  _t, _t, _t];
                    for (var _d = 0; _d < 8; _d++) {
                        draw_text_transformed_color(_fx + _dx[_d], _fy + _dy[_d], _data.char, _sx, _sy, 0, _data.out_color, _data.out_color, _data.out_color, _data.out_color, _base_alpha);
                    }
                }

                draw_text_transformed_color(_fx, _fy, _data.char, _sx, _sy, 0, _data.color, _data.color, _data.color, _data.color, _base_alpha);

                _draw_x += _data.width_base * _ui_scale_x + _real_char_space;
                _visible_drawn += 1;
            }

            _draw_y += _real_line_space;
        }

        draw_set_font(_old_font);
    }
}