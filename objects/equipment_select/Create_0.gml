// 确保当前装备已初始化
if (!variable_struct_exists(global, "current_equipment")) {
	GlobalInit();
}

// 初始化全局装备选择变量
if (!variable_struct_exists(global, "_current_equipment_select")) {
	global._current_equipment_select = {
		options: [],
		current_obj: -1,
		equip_key: "",
		placeholder: "",
		caller_btn: undefined
	};
}

instance_create_depth(0,0,0,oSteadyDeltaTime)

// 获取各类装备选项列表
var _planes = EquipmentSelect_GetEquipmentOptions(plane_agent, "");
var _wingmans = EquipmentSelect_GetEquipmentOptions(wingman_agent, "");
var _subweapons = EquipmentSelect_GetEquipmentOptions(emitter_player, "subweapon_");
var _armors = EquipmentSelect_GetEquipmentOptions(armor_agent, "");

// 创建 LimeUI 主界面
main_ui = new LuiMain();
demo_style_modern = new LuiStyle()
	.setMinSize(32, 32)
	.setPadding(16)
	.setGap(16)
	.setSymbolPassword("*")
	.setFonts(Lang_GetFont("zpix"), Lang_GetFont("zpix"), fModern)
	.setSprites(sUI_Square_21r, sUI_Square_6r)
	.setSpriteCheckbox(sUI_button, sUI_checkbox_pin)
	.setSpriteToggleSwitch(sToggleSwitch, sToggleSwitchSlider)
	.setSpriteComboBoxArrow(sUI_ComboBoxArrow)
	.setSpriteRing(sRing, sRing)
	.setSpriteScrollSlider(sUI_Square_6r, sUI_Square_6r)
	.setColors(#393a44, merge_color(#393a44, c_white, 0.1), merge_color(#393a44, c_black, 0.2), #64d0b9) //_primary, _secondary, _back, _accent, _border
	.setColorAccent(#64d0b9)
	.setColorHover(c_gray)
	.setColorText(#ffffff, #9a9daf)
	.setSounds(sndBasicClick)
	.setScrollSliderWidth(20)
main_ui.setStyle(demo_style_modern).centerContent();

// 辅助：创建装备选择按钮
function _make_equipment_button(_options, _current_obj, _equip_key, _placeholder) {
	var _current_name = _current_obj != -1 && _current_obj != noone && object_exists(_current_obj) ? object_get_name(_current_obj) : _placeholder;
	var _btn = new LuiButton({ text: _current_name, width: 450, height: 36 });
	_btn.original_text = _current_name; // 保存原始文本
	_btn.equip_key = _equip_key; // 保存装备键
	_btn.placeholder = _placeholder; // 保存占位符
	_btn.options = _options; // 保存选项数组
	_btn.current_obj = _current_obj; // 保存当前对象
	
	_btn.addEvent(LUI_EV_CLICK, function(_el) {
		// 设置全局变量
		global._current_equipment_select.options = _el.options;
		global._current_equipment_select.current_obj = _el.current_obj;
		global._current_equipment_select.equip_key = _el.equip_key;
		global._current_equipment_select.placeholder = _el.placeholder;
		global._current_equipment_select.caller_btn = _el;
		
		_create_equipment_selection_window();
	});
	
	return _btn;
}

// 辅助：创建装备选择窗口
function _create_equipment_selection_window() {
	// 获取全局变量
	var _options = global._current_equipment_select.options;
	var _current_obj = global._current_equipment_select.current_obj;
	var _equip_key = global._current_equipment_select.equip_key;
	var _placeholder = global._current_equipment_select.placeholder;
	var _caller_btn = global._current_equipment_select.caller_btn;
	
	// 创建窗口
	var _window = new LuiWindow({ title: _placeholder, width: 600, height: 500 });
	
	// 创建滚动面板
	var _scroll_panel = new LuiScrollPanel({ width: 560, height: 400 });
	
	// 创建装备选项列表
	var _options_column = new LuiColumn().setGap(8).setPadding(8);
	var _current_option_index = -1; // 记录当前装备的索引位置
	
	for (var i = 0; i < array_length(_options); i++) {
		var _opt = _options[i];
		var _is_current = _current_obj != -1 && _current_obj != noone && object_exists(_current_obj) && _opt.obj == _current_obj;
		var _btn_color = _is_current ? demo_style_modern.color_accent : demo_style_modern.color_secondary;
		
		// 记录当前装备的索引
		if (_is_current) {
			_current_option_index = i;
		}
		
		var _option_btn = new LuiButton({ 
			text: _opt.name, 
			width: 440, 
			height: 40,
			color: _btn_color
		});
		
		// 存储数据以便在点击时使用
		_option_btn.data = { 
			key: _equip_key, 
			value: _opt.obj,
			name: _opt.name,
			caller_btn: _caller_btn,
			window: _window
		};
		
		_option_btn.addEvent(LUI_EV_CLICK, function(_el) {
			var k = _el.data.key;
			var v = _el.data.value;
			if (k == "wingman_left") global.current_equipment.wingman_left = [v];
			else if (k == "wingman_right") global.current_equipment.wingman_right = [v];
			else variable_struct_set(global.current_equipment, k, v);
			
			// 更新按钮文本和当前对象引用
			var _caller_btn = _el.data.caller_btn;
			_caller_btn.setText(_el.data.name);
			_caller_btn.current_obj = v; // 更新当前对象引用
			
			// 关闭窗口
			_el.data.window.closeWindow();
		});
		
		_options_column.addContent(_option_btn);
	}
	
	_scroll_panel.addContent(_options_column);
	_window.addContent(_scroll_panel);
	
	// 窗口创建后立即设置滚动位置
	if (_current_option_index >= 0) {
		// 计算当前装备按钮的垂直位置（按钮高度 + 间距）
		var _button_height = 40; // 按钮高度
		var _gap = 8; // 按钮间距
		var _padding = 8; // 列内边距
		var _scroll_position = (_button_height + _gap) * _current_option_index + _padding;
		
		// 设置滚动位置，确保当前装备在可视区域中间位置
		_scroll_panel.scroll_target_offset_y = -_scroll_position+150;
	}
	
	main_ui.addContent(_window);
}

// 战机
var _current_plane = global.current_equipment.plane;
var _btn_plane = _make_equipment_button(_planes, _current_plane, "plane", "选择战机");

// 左僚机（current 为数组第一个）
var _wl = global.current_equipment.wingman_left;
var _current_wl = (is_array(_wl) && array_length(_wl) > 0) ? _wl[0] : -1;
var _btn_wingman_left = _make_equipment_button(_wingmans, _current_wl, "wingman_left", "选择左僚机");

// 右僚机
var _wr = global.current_equipment.wingman_right;
var _current_wr = (is_array(_wr) && array_length(_wr) > 0) ? _wr[0] : -1;
var _btn_wingman_right = _make_equipment_button(_wingmans, _current_wr, "wingman_right", "选择右僚机");

// 副武器
var _current_sub = global.current_equipment.subweapon;
var _btn_subweapon = _make_equipment_button(_subweapons, _current_sub, "subweapon", "选择副武器");

// 装甲
var _current_armor = global.current_equipment.armor;
var _btn_armor = _make_equipment_button(_armors, _current_armor, "armor", "选择装甲");

// “进入战斗”按钮：应用当前选择并跳转战斗房间
var _btn_enter = new LuiButton({ text: "进入战斗", width: 200, height: 44 }).setFlexAlignSelf(flexpanel_align.center);
_btn_enter.addEvent(LUI_EV_CLICK, function(_el) {
	room_goto(room_battle);
});

// 标题与布局
var _title = new LuiText({ value: "装备选择" }).setTextHalign(fa_center);
var _row_plane = new LuiRow().addContent([
	new LuiText({ value: "战机", width: 80 }),
	_btn_plane
]);
var _row_wl = new LuiRow().addContent([
	new LuiText({ value: "左僚机", width: 80 }),
	_btn_wingman_left
]);
var _row_wr = new LuiRow().addContent([
	new LuiText({ value: "右僚机", width: 80 }),
	_btn_wingman_right
]);
var _row_sub = new LuiRow().addContent([
	new LuiText({ value: "副武器", width: 80 }),
	_btn_subweapon
]);
var _row_armor = new LuiRow().addContent([
	new LuiText({ value: "装甲", width: 80 }),
	_btn_armor
]);

var _enter_btn_container = new LuiContainer().setFlexAlignSelf(flexpanel_align.center);
_enter_btn_container.addContent(_btn_enter);

var _col = new LuiColumn().setPadding(8);
_col.addContent([_title, _row_plane, _row_wl, _row_wr, _row_sub, _row_armor, _enter_btn_container]);

var _panel = new LuiPanel({ width: 600, height: LUI_AUTO }).setPadding(16);
_panel.addContent(_col);

main_ui.addContent(_panel);