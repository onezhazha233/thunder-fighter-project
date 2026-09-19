/// @function draw_sprite_nineslice(sprite, subimg, x, y, width, height, scale_x, scale_y, center_mode, color, alpha)
/// @desc 自动读取Sprite边框厚度的九宫格函数。四边强制拉伸，中心由参数指定0(拉伸)或1(重复)。
/// @param {Asset.GMSprite} _spr 精灵资产
/// @param {Real} _img 子图索引
/// @param {Real} _x 绘制起始 X (左上角)
/// @param {Real} _y 绘制起始 Y (左上角)
/// @param {Real} _w 设计排版宽度 (未受动画缩放影响的宽度)
/// @param {Real} _h 设计排版高度 (未受动画缩放影响的高度)
/// @param {Real} _sc_x 整体动画缩放系数 X
/// @param {Real} _sc_y 整体动画缩放系数 Y
/// @param {Real} _center_mode 中心填充模式: 0 = 拉伸 (Stretch), 1 = 重复 (Repeat)
/// @param {Constant.Color} _color 混合颜色
/// @param {Real} _alpha 透明度
function draw_sprite_nineslice(_spr, _img, _x, _y, _w, _h, _sc_x=1.0, _sc_y=1.0, _center_mode=0, _color=c_white, _alpha=1.0) {
	// 1. 自动读取官方九宫格边框厚度
	var _n_l = 0; var _n_t = 0; var _n_r = 0; var _n_b = 0;
	var _ns_info = sprite_get_nineslice(_spr);
	
	_n_l = _ns_info.left;
	_n_t = _ns_info.top;
	_n_r = _ns_info.right;
	_n_b = _ns_info.bottom;

	// 2. 获取原纹理切片基础尺寸
	var _orig_w = sprite_get_width(_spr);
	var _orig_h = sprite_get_height(_spr);

	var _w1 = _n_l;
	var _w3 = _n_r;
	var _w2 = _orig_w - _w1 - _w3;

	var _h1 = _n_t;
	var _h3 = _n_b;
	var _h2 = _orig_h - _h1 - _h3;

	// 3. 计算缩放后的屏幕总显示尺寸，并取整到像素边界
	var _total_w = _w * _sc_x;
	var _total_h = _h * _sc_y;
	var _px_total_w = round(_total_w);
	var _px_total_h = round(_total_h);

	// 四角物理像素宽度取整到最近像素，避免子像素缝隙
	var _px_sw1 = round(_w1 * _sc_x); if (_px_sw1 < 1 && _w1 > 0) _px_sw1 = 1;
	var _px_sw3 = round(_w3 * _sc_x); if (_px_sw3 < 1 && _w3 > 0) _px_sw3 = 1;
	var _px_sh1 = round(_h1 * _sc_y); if (_px_sh1 < 1 && _h1 > 0) _px_sh1 = 1;
	var _px_sh3 = round(_h3 * _sc_y); if (_px_sh3 < 1 && _h3 > 0) _px_sh3 = 1;

	// 中间区域填满剩余像素空间
	var _px_sw2 = max(_px_total_w - _px_sw1 - _px_sw3, 0);
	var _px_sh2 = max(_px_total_h - _px_sh1 - _px_sh3, 0);

	// 4. 计算9宫格绝对像素坐标栅格起点（全部取整到像素格点）
	var _x0 = round(_x);
	var _x1 = _x0 + _px_sw1;
	var _x2 = _x0 + _px_sw1 + _px_sw2;
	var _y0 = round(_y);
	var _y1 = _y0 + _px_sh1;
	var _y2 = _y0 + _px_sh1 + _px_sh2;

	// 5. 计算各片的实际缩放系数
	var _sc_x1 = _px_sw1 / _w1;
	var _sc_x3 = _px_sw3 / _w3;
	var _sc_y1 = _px_sh1 / _h1;
	var _sc_y3 = _px_sh3 / _h3;

	// ==========================================
	// 基础绘制：绘制四个角
	// ==========================================
	draw_sprite_part_ext(_spr, _img, 0,       0,       _w1, _h1, _x0, _y0, _sc_x1, _sc_y1, _color, _alpha); // 左上
	draw_sprite_part_ext(_spr, _img, _w1+_w2, 0,       _w3, _h1, _x2, _y0, _sc_x3, _sc_y1, _color, _alpha); // 右上
	draw_sprite_part_ext(_spr, _img, 0,       _h1+_h2, _w1, _h3, _x0, _y2, _sc_x1, _sc_y3, _color, _alpha); // 左下
	draw_sprite_part_ext(_spr, _img, _w1+_w2, _h1+_h2, _w3, _h3, _x2, _y2, _sc_x3, _sc_y3, _color, _alpha); // 右下

	// ==========================================
	// 四边绘制：强制拉伸
	// ==========================================
	if (_w2 > 0 && _px_sw2 > 0) {
		var _edge_sc_x = _px_sw2 / _w2;
		draw_sprite_part_ext(_spr, _img, _w1, 0,       _w2, _h1, _x1, _y0, _edge_sc_x, _sc_y1, _color, _alpha); // 上
		draw_sprite_part_ext(_spr, _img, _w1, _h1+_h2, _w2, _h3, _x1, _y2, _edge_sc_x, _sc_y3, _color, _alpha); // 下
	}
	if (_h2 > 0 && _px_sh2 > 0) {
		var _edge_sc_y = _px_sh2 / _h2;
		draw_sprite_part_ext(_spr, _img, 0,       _h1, _w1, _h2, _x0, _y1, _sc_x1, _edge_sc_y, _color, _alpha); // 左
		draw_sprite_part_ext(_spr, _img, _w1+_w2, _h1, _w3, _h2, _x2, _y1, _sc_x3, _edge_sc_y, _color, _alpha); // 右
	}

	// ==========================================
	// 中心绘制：0(拉伸) 或 1(重复)
	// ==========================================
	if (_w2 > 0 && _h2 > 0 && _px_sw2 > 0 && _px_sh2 > 0) {
		if (_center_mode == 0) {
			// 模式 0：中心直接拉伸
			draw_sprite_part_ext(_spr, _img, _w1, _h1, _w2, _h2, _x1, _y1, _px_sw2 / _w2, _px_sh2 / _h2, _color, _alpha);
		} 
		else if (_center_mode == 1) {
			// 模式 1：中心矩阵硬件裁剪平铺
			var _old_scissor = gpu_get_scissor();
			gpu_set_scissor(_x1, _y1, _px_sw2, _px_sh2);
			
			var _unit_w = _w2 * _sc_x;
			var _unit_h = _h2 * _sc_y;
			
			var _curr_x = _x1;
			while (_curr_x < _x1 + _px_sw2) {
				var _curr_y = _y1;
				while (_curr_y < _y1 + _px_sh2) {
					draw_sprite_part_ext(_spr, _img, _w1, _h1, _w2, _h2, _curr_x, _curr_y, _sc_x, _sc_y, _color, _alpha);
					_curr_y += _unit_h;
				}
				_curr_x += _unit_w;
			}
			gpu_set_scissor(_old_scissor);
		}
	}
}