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

	// 3. 计算在整体动画缩放(_sc_x, _sc_y)下，四角边框的实际物理显示厚度
	var _sw1 = _w1 * _sc_x;
	var _sw3 = _w3 * _sc_x;
	var _sh1 = _h1 * _sc_y;
	var _sh3 = _h3 * _sc_y;

	// 计算缩放后的屏幕总显示尺寸与内部区域尺寸
	var _total_w = _w * _sc_x;
	var _total_h = _h * _sc_y;
	var _sw2 = _total_w - _sw1 - _sw3;
	var _sh2 = _total_h - _sh1 - _sh3;

	// 4. 计算 9 宫格绝对屏幕坐标栅格起点
	var _x0 = _x; var _x1 = _x + _sw1; var _x2 = _x + _total_w - _sw3;
	var _y0 = _y; var _y1 = _y + _sh1; var _y2 = _y + _total_h - _sh3;

	// ==========================================
	// 基础绘制：固定绘制四个角（随整体缩放）
	// ==========================================
	draw_sprite_part_ext(_spr, _img, 0,	   0,	   _w1, _h1, _x0, _y0, _sc_x, _sc_y, _color, _alpha); // 左上
	draw_sprite_part_ext(_spr, _img, _w1+_w2, 0,	   _w3, _h1, _x2, _y0, _sc_x, _sc_y, _color, _alpha); // 右上
	draw_sprite_part_ext(_spr, _img, 0,	   _h1+_h2, _w1, _h3, _x0, _y2, _sc_x, _sc_y, _color, _alpha); // 左下
	draw_sprite_part_ext(_spr, _img, _w1+_w2, _h1+_h2, _w3, _h3, _x2, _y2, _sc_x, _sc_y, _color, _alpha); // 右下

	// ==========================================
	// 四边绘制：强制按拉伸（Stretch）逻辑处理
	// ==========================================
	// 上边框 & 下边框
	if (_w2 > 0 && _sw2 > 0) {
		var _edge_sc_x = _sw2 / _w2;
		draw_sprite_part_ext(_spr, _img, _w1, 0,	   _w2, _h1, _x1, _y0, _edge_sc_x, _sc_y, _color, _alpha); // 上
		draw_sprite_part_ext(_spr, _img, _w1, _h1+_h2, _w2, _h3, _x1, _y2, _edge_sc_x, _sc_y, _color, _alpha); // 下
	}
	// 左边框 & 右边框
	if (_h2 > 0 && _sh2 > 0) {
		var _edge_sc_y = _sh2 / _h2;
		draw_sprite_part_ext(_spr, _img, 0,	   _h1, _w1, _h2, _x0, _y1, _sc_x, _edge_sc_y, _color, _alpha); // 左
		draw_sprite_part_ext(_spr, _img, _w1+_w2, _h1, _w3, _h2, _x2, _y1, _sc_x, _edge_sc_y, _color, _alpha); // 右
	}

	// ==========================================
	// 中心绘制：依据 _center_mode 区分 0(拉伸) 或 1(重复)
	// ==========================================
	if (_w2 > 0 && _h2 > 0 && _sw2 > 0 && _sh2 > 0) {
		if (_center_mode == 0) {
			// 模式 0：中心直接拉伸
			draw_sprite_part_ext(_spr, _img, _w1, _h1, _w2, _h2, _x1, _y1, _sw2 / _w2, _sh2 / _h2, _color, _alpha);
		} 
		else if (_center_mode == 1) {
			// 模式 1：中心矩阵硬件裁剪平铺
			var _old_scissor = gpu_get_scissor();
			gpu_set_scissor(_x1, _y1, _sw2, _sh2); // 限制渲染边界
			
			var _unit_w = _w2 * _sc_x;
			var _unit_h = _h2 * _sc_y;
			
			var _curr_x = _x1;
			while (_curr_x < _x1 + _sw2) {
				var _curr_y = _y1;
				while (_curr_y < _y1 + _sh2) {
					draw_sprite_part_ext(_spr, _img, _w1, _h1, _w2, _h2, _curr_x, _curr_y, _sc_x, _sc_y, _color, _alpha);
					_curr_y += _unit_h;
				}
				_curr_x += _unit_w;
			}
			gpu_set_scissor(_old_scissor); // 恢复裁剪
		}
	}
}