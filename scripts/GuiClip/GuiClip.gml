function GuiClip_Start(){
	var _game_w = 720;
	var _game_h = 1280;

	if (os_type == os_windows) {
	    _screen_w = window_get_width();
	    _screen_h = window_get_height();
	} else {
	    _screen_w = display_get_width();
	    _screen_h = display_get_height();
	}

	// 等比缩放：保持 16:9，完整显示游戏
	var _scale = min(
		_screen_w / _game_w,
		_screen_h / _game_h
	);

	// 游戏画面在实际显示区域中的尺寸
	var _clip_w = round(_game_w * _scale);
	var _clip_h = round(_game_h * _scale);

	// 居中后的实际显示位置
	var _clip_x = floor((_screen_w - _clip_w) * 0.5);
	var _clip_y = floor((_screen_h - _clip_h) * 0.5);

	// 保存原来的剪裁范围
	global.old_scissor = gpu_get_scissor();
	
	gpu_set_scissor(
	    _clip_x,
	    _clip_y,
	    _clip_w,
	    _clip_h
	);
}

function GuiClip_End(){
	gpu_set_scissor(global.old_scissor);
}