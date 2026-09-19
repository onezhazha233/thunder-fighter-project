/// UI_Warmup()
/// 预加载所有UI资源，消除首次打开界面时的卡顿
/// 可在任意事件中调用（不依赖 Draw 上下文）
///
/// 卡顿原因分析：
/// 1. 纹理上传：精灵第一次绘制时才上传到VRAM（最严重的卡顿源）
/// 2. JIT编译：GMS2 VM模式下，函数第一次调用时编译为字节码
/// 3. 字体纹理：字符第一次绘制时才栅格化到字体图集页
/// 4. 富文本解析：draw_text_rich 的标记解析在第一次绘制时执行
///
/// 预热策略：
/// - sprite_prefetch_multi → 批量提交纹理上传，比逐帧按需上传快得多
/// - 调用所有组件构造器 → 触发JIT编译，界面打开时不再卡编译
/// - 预跑富文本解析 → 布局缓存命中，省去解析时间
/// - font_cache_glyph → 预栅格化常用字体字形
function UI_Warmup() {
	// ===== 1. 预加载所有UI精灵到VRAM =====
	var _ui_sprites = [
		// 设备选择界面
		spr_ui_selectpanel, spr_ui_selectequipment, spr_ui_selectboss,
		spr_ui_button_flat, spr_ui_icon_settings, spr_ui_list,
		spr_ui_button_close, spr_ui_icon_music, spr_ui_switch,
		spr_ui_icon_sound, spr_ui_equipment_element, spr_ui_button,
		// 暂停界面
		spr_ui_pause_button_quit, spr_ui_pause_button_base,
		spr_ui_pause_button_resume,
		// HUD
		spr_ui_hpbar_player, spr_ui_hpbar_score_number,
		spr_ui_hpbar_player_red, spr_ui_hpbar_player_yellow,
		spr_ui_hpbar_boss_name, spr_ui_hpbar_boss_bg, spr_ui_hpbar_boss_bar,
		spr_ui_hpbar_enemy,
		// 滑块/滚动条
		spr_ui_slider_bg, spr_ui_slider_knob, spr_ui_slider_bar,
		spr_ui_scroll_knob,
		// Boss 警告
		spr_ui_warning_boss_text_small, spr_ui_warning_boss_textbar,
		spr_ui_warning_boss_slash, spr_ui_warning_boss_lv_hellhound,
		// Ready/Go
		spr_ui_readygo_ready_blue, spr_ui_readygo_ready_white,
		spr_ui_readygo_go,
		// 图标
		spr_icon_alloy_a
	];
	sprite_prefetch_multi(_ui_sprites);

	// ===== 2. 预热UI组件构造器（触发所有构造器JIT编译）=====
	var _warm_btn = new UIButton(spr_ui_button, 0, 0, 1, 1);
	var _warm_txt = new UIText("Warmup", 0, 0);
	var _warm_img = new UIImage(spr_ui_button, 0, 0, 1, 1);
	var _warm_sld = new UISlider(0, 0, 1, 1, 0, 1, 0);
	var _warm_swt = new UISwitch(spr_ui_switch, 0, 0);
	var _warm_scrl = new UIScrollPanel(0, 0, 1, 1);

	// ===== 3. 预热富文本解析（JIT + 布局缓存）=====
	// 首次 string_width 会触发 GMS2 生成字体字形纹理页
	// 注意：传递字体引用后再调 _Build()
	var _warm_rte = new RichTextLayout();
	_warm_rte.text = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	_warm_rte.text += "abcdefghijklmnopqrstuvwxyz";
	_warm_rte.text += "0123456789";
	_warm_rte.text += "测试文本，。！？【】（）、；：";
	_warm_rte.font = Lang_GetFont("zpix");
	_warm_rte.line_space = 24;
	_warm_rte.Invalidate();
	_warm_rte._Build();

	// ===== 4. 预热字体字形缓存（强制栅格化到字体纹理页）=====
	var _zpix = Lang_GetFont("zpix");
	if (font_exists(_zpix)) {
		font_cache_glyph(_zpix, ord("A"));
		font_cache_glyph(_zpix, ord("测"));
		font_cache_glyph(_zpix, ord("1"));
	}

	// ===== 5. 预热九宫格绘制函数（JIT编译）=====
	draw_sprite_nineslice(spr_ui_button, 0, -5000, -5000, 1, 1, 1, 1, 0, c_white, 1);

	// ===== 6. 预热动画系统 =====
	var _warm_img2 = new UIImage(spr_ui_button, 0, 0, 1, 1);
	Anim_Create(_warm_img2, "scale_x", ANIM_TWEEN.QUAD, ANIM_EASE.OUT, 1, 0, 1);
	_warm_img2.Destroy();

	// ===== 7. 清理预热对象 =====
	_warm_btn.Destroy();
	_warm_txt.Destroy();
	_warm_img.Destroy();
	_warm_sld.Destroy();
	_warm_swt.Destroy();
	_warm_scrl.Destroy();
}