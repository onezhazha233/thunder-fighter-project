live;
depth = -100;

if (!variable_struct_exists(global, "_current_equipment_select")) {
	global._current_equipment_select = {
		options: [],
		current_obj: -1,
		equip_key: "",
		placeholder: "",
		caller_btn: undefined,
		window: undefined,
		preview_inst: noone,
		preview_x: room_width / 2,
		preview_y: 320,
		preview_scale: 1
	};
}

var _planes = EquipmentSelect_GetEquipmentOptions(plane_agent, "");
var _wingmans = EquipmentSelect_GetEquipmentOptions(wingman_agent, "");
var _subweapons = EquipmentSelect_GetEquipmentOptions(emitter_player, "subweapon_");
var _armors = EquipmentSelect_GetEquipmentOptions(armor_agent, "");

main_ui = new LuiMain();
demo_style_modern = new LuiStyle()
	.setMinSize(1,1)
	.setPadding(16)
	.setGap(16)
	.setSymbolPassword("*")
	.setFonts(Lang_GetFont("zpix"), Lang_GetFont("zpix"), fModern)
	.setSprites(spr_ui_list, sUI_Square_6r)
	.setSpriteCheckbox(sUI_button, sUI_checkbox_pin)
	.setSpriteToggleSwitch(sToggleSwitch, sToggleSwitchSlider)
	.setSpriteComboBoxArrow(sUI_ComboBoxArrow)
	.setSpriteRing(sRing, sRing)
	.setSpriteScrollSlider(sUI_Square_6r, sUI_Square_6r)
	.setColors(c_white,merge_color(#393a44, c_white, 0.1), merge_color(#393a44, c_black, 0.2), #64d0b9)//_primary, _secondary, _back, _accent, _border
	.setColorAccent(#64d0b9)
	.setColorHover(c_gray)
	.setColorText(#ffffff, #9a9daf)
	.setSounds(sndBasicClick)
	.setScrollSliderWidth(10)
main_ui.setStyle(demo_style_modern).centerContent();

luiNextDebugMode()

main_window = new LuiPanel()
main_window.panel_sprite = spr_ui_selectpanel
main_window.setPositionAbsolute()
main_window.setSize(588,697)
main_window.y = 500

main_window_title = new LuiText({height: 50})
.setText(Lang_GetString("ui.select.preparation"))
.setTextHalign(fa_center)
main_window_title.y = 15
main_window_title.text_scale = 1.4
main_window_title.text_outline = true
main_window_title.text_outline_width = 2
main_window_title.text_outline_color = make_color_rgb(0,65,140)
main_window.addContent(main_window_title)

select_row0 = new LuiRow();
select_row0.y += 20
select_row1 = new LuiRow();
select_row1.y += 40

select_equipment_plane = new LuiPanel()
select_equipment_plane.panel_sprite = spr_ui_selectequipment
select_equipment_plane.setSize(156,172)
.x += 28

button_select_plane = new LuiButton()
with(button_select_plane){
	x -= 9;
	y -= 9;
	width = 144;
	height = 144;
	draw = function(){
		spr = other.equipment_obj2name(global.current_equipment.plane);
		draw_icon(x,y,spr);
	}
}
button_select_plane.addEvent(LUI_EV_CLICK,function(_el){
	create_select_window(0);
})
select_equipment_plane.addContent(button_select_plane)

select_equipment_armor = new LuiPanel()
select_equipment_armor.panel_sprite = spr_ui_selectequipment
select_equipment_armor.setSize(156,172)
.x += 28

select_equipment_subweapon = new LuiPanel()
select_equipment_subweapon.panel_sprite = spr_ui_selectequipment
select_equipment_subweapon.setSize(156,172)
.x += 28

select_equipment_wingman_left = new LuiPanel()
select_equipment_wingman_left.panel_sprite = spr_ui_selectequipment
select_equipment_wingman_left.setSize(156,172)
.x += 114

select_equipment_wingman_right = new LuiPanel()
select_equipment_wingman_right.panel_sprite = spr_ui_selectequipment
select_equipment_wingman_right.setSize(156,172)
.x += 114

button_select_boss = new LuiButton({text: Lang_GetString("ui.select.boss")}).setSize(300,56);
button_select_boss.setFlexAlignSelf(flexpanel_align.center)
.y += 60
with(button_select_boss){
	draw = function(){
		var subimg = 0;
		if(self.is_pressed){
			subimg = 1;
		}else if(self.isMouseHovered()){
			subimg = 0;
		}
		draw_sprite(spr_ui_selectboss,subimg,self.x,self.y);
		DrawSetText(make_color_rgb(125,12,154),,fa_center,fa_middle,1);
		DrawTextOutline(self.x+width/2,self.y+height/2+subimg*2-4,text,2,make_color_rgb(233,143,255),8);
		DrawSetText(c_white);
	}
}
button_startbattle = new LuiButton({text: Lang_GetString("ui.startbattle")}).setSize(140,56);
button_startbattle.setFlexAlignSelf(flexpanel_align.center)
.y += 60
with(button_startbattle){
	draw = function(){
		var subimg = 0;
		if(self.is_pressed){
			subimg = 1;
		}else if(self.isMouseHovered()){
			subimg = 0;
		}
		draw_sprite(spr_ui_startbattle,subimg,self.x,self.y);
		DrawSetText(make_color_rgb(0,65,140),,fa_center,fa_middle,1);
		DrawTextOutline(self.x+width/2,self.y+height/2+subimg*2-4,text,2,make_color_rgb(57,162,225),8);
		DrawSetText(c_white);
	}
}

select_row0.addContent([select_equipment_plane,select_equipment_armor,select_equipment_subweapon])
select_row1.addContent([select_equipment_wingman_left,select_equipment_wingman_right])
main_window.addContent([select_row0,select_row1])
main_window.addContent(button_select_boss)
main_window.addContent(button_startbattle)

main_ui.addContent(main_window)

create_select_window = function(type){//0为战机 1为装甲 2为副武器 3为左僚机 4为右僚机
	window_select = new LuiPanel()
	.setSize(720,1000)
	window_select.y += 50

	if(type = 0){
		et = "plane";
		equipments = Equipment_plane();
		current_equipment = global.current_equipment.plane;
	}
	if(type = 1){
		et = "armor";
		equipments = Equipment_armor();
		current_equipment = global.current_equipment.armor;
	}
	if(type = 2){
		et = "subweapon";
		equipments = Equipment_Subweapon();
		current_equipment = global.current_equipment.subweapon;
	}
	if(type = 3){
		et = "wingman_left";
		current_equipment = global.current_equipment.wingman_left[0];
	}
	if(type = 4){
		et = "wingman_right";
		current_equipment = global.current_equipment.wingman_right[0];
	}
	if(type >= 3)equipments = Equipment_wingman();
	
	window_select_title = new LuiText({height: 50})
	.setText(Lang_GetString("ui."+et))
	.setTextHalign(fa_center)
	window_select_title.text_scale = 1.4
	window_select_title.text_outline = true
	window_select_title.text_outline_width = 2
	window_select_title.text_outline_color = make_color_rgb(0,65,140)

	tr = new LuiRow().addContent(window_select_title)
	tl = new LuiRow()
	list = new LuiScrollPanel()
	list.setSize(700,880)
	list.draw_base = false

	ii = -1;
	for (var i = 0; i < array_length(equipments); i++) {
		selected = (equipment_obj2name(current_equipment)==equipments[i].icon)
	    list.addContent(create_equipment_item(equipments[i],type,selected));
		if(selected = true)ii = i;
	}
	
	list.scroll_target_offset_y = -(ii-2)*145;

	tl.addContent(new LuiColumn().addContent(list));
	window_select.addContent([tr,tl]);

	closebtn = new LuiButton({width:98,height:52});
	closebtn.setPositionAbsolute();
	closebtn.setPosition(602,16);
	with(closebtn){
		draw = function(){
			var subimg = 0;
			if(self.is_pressed){
				subimg = 1;
			}else if(self.isMouseHovered()){
				subimg = 0;
			}
			draw_sprite(spr_ui_button_close,subimg,self.x,self.y);
		}
	}
	closebtn.addEvent(LUI_EV_CLICK,function(_el){
		window_select.destroy();
	})
	window_select.addContent(closebtn);
	main_ui.addContent(window_select);
}

function create_equipment_item(data,type,selected=0) {
    var rootp = new LuiPanel()
		.setWidth(657)
        .setHeight(129)
        .setPadding(20)
        .setGap(10)
	rootp.panel_sprite = spr_ui_equipment_element;
	var root = new LuiRow();

    /// 左：头像 + 星级
    var left = new LuiColumn()
        .setWidth(90)
	
	equipment_icon = new LuiIcon({value: data.icon, quality: data.quality,scale: 90/144});
	equipment_icon.setSize(90,90);
	equipment_icon.setPadding(0);
    left.addContent(equipment_icon);

    /// 中：文字信息
    var center = new LuiColumn()
        .setGap(12);

    center.addContent(new LuiText({value:data.name}));
    center.addContent(new LuiText({value: Lang_GetString("ui.ability")+" "+ data.ability}));

    /// 右：按钮或状态
    var right = new LuiColumn()
        .setWidth(120)
		.setPosition(5,8);
	if(selected = true){
		btn = new LuiText({value: "已装备", x:20, y: 17});
		btn.color_override=c_green;
	}
	else{
		btn = new LuiButton({text: Lang_GetString("ui.equip")}).setSize(118,73);
		btn.equipment_name = data.icon;
		btn.type = type;
		btn.addEvent(LUI_EV_CLICK,function(_el){
			te = equipment_name2obj(_el.equipment_name,_el.type);
			if(_el.type = 0)global.current_equipment.plane = te;
			if(_el.type = 1)global.current_equipment.armor = te;
			if(_el.type = 2)global.current_equipment.subweapon = te;
			if(_el.type = 3)global.current_equipment.wingman_left[0] = te;
			if(_el.type = 4)global.current_equipment.wingman_right[0] = te;
			window_select.destroy();
		})
		with(btn){
			draw = function(){
				var subimg = 0;
				if(self.is_pressed){
					subimg = 1;
				}else if(self.isMouseHovered()){
					subimg = 0;
				}
				draw_sprite(spr_ui_button,subimg,self.x,self.y);
				DrawSetText(make_color_rgb(0,65,140),,fa_center,fa_middle,1);
				DrawTextOutline(self.x+width/2,self.y+height/2+subimg*2-4,text,2,make_color_rgb(57,162,225),8);
				DrawSetText(c_white);
			}
		}
	}
    right.addContent(btn);

    root.addContent(left);
    root.addContent(center);
    root.addContent(right);
	rootp.addContent(root);

    return rootp;
}

equipment_obj2name = function(obj){
	var name;
	if!(is_string(obj)){
		name = object_get_name(obj);
	}
	else{
		name = obj;
	}
	return string_copy(name,string_pos("_",name)+1,999);
}

equipment_name2obj = function(name,type){
	var prefix;
	if(type = 0)prefix = "plane_";
	if(type = 1)prefix = "armor_";
	if(type = 2)prefix = "subweapon_";
	if(type >= 3)prefix = "wingman_";
	
	return asset_get_index(prefix+name);
}

/*

function _refresh_preview() {
	if (instance_exists(global._current_equipment_select.preview_inst)) {
		instance_destroy(global._current_equipment_select.preview_inst);
	}

	var px = global._current_equipment_select.preview_x;
	var py = global._current_equipment_select.preview_y;
	var sc = global._current_equipment_select.preview_scale;
	var inst = instance_create_depth(px, py, 0, equipment_agent);
	inst.player_point_enabled = false;
	inst.enabled = false;
	inst.xscale = sc;
	inst.yscale = sc;
	inst.angle = 0;
	inst.plane = global.current_equipment.plane;
	inst.wingman_left = global.current_equipment.wingman_left;
	inst.wingman_right = global.current_equipment.wingman_right;
	inst.wingman_x_offset = global.current_equipment.wingman_x_offset;
	inst.wingman_y_offset = global.current_equipment.wingman_y_offset;
	inst.subweapon = global.current_equipment.subweapon;
	inst.armor = global.current_equipment.armor;
	inst.alarm[0] = 1;
	inst.depth = 0;
	if (variable_instance_exists(inst, "SetPosition")) {
		inst.SetPosition(px, py);
	}
	global._current_equipment_select.preview_inst = inst;
}

function _make_equipment_button(_options, _current_obj, _equip_key, _placeholder) {
	var _current_name = _placeholder;
	if (_current_obj != -1 && _current_obj != noone && object_exists(_current_obj)) {
		if (_equip_key == "choicebosswave") {
			var _obj_name = object_get_name(_current_obj);
			if (string_pos("wave_boss_", _obj_name) == 1) {
				var _boss_name = string_delete(_obj_name, 1, 10);
				_current_name = Lang_GetString("boss." + _boss_name);
			} else {
				_current_name = Equipment_GetName(_current_obj);
			}
		} else {
			_current_name = Equipment_GetName(_current_obj);
		}
	}

	var _btn = new LuiButton({ text: _current_name, width: 450, height: 36 });
	_btn.original_text = _current_name;
	_btn.equip_key = _equip_key;
	_btn.placeholder = _placeholder;
	_btn.options = _options;
	_btn.current_obj = _current_obj;

	_btn.addEvent(LUI_EV_CLICK, function(_el) {
		global._current_equipment_select.options = _el.options;
		global._current_equipment_select.current_obj = _el.current_obj;
		global._current_equipment_select.equip_key = _el.equip_key;
		global._current_equipment_select.placeholder = _el.placeholder;
		global._current_equipment_select.caller_btn = _el;
		_create_equipment_selection_window();
	});

	return _btn;
}

function _create_equipment_option_item(_opt, _current_obj, _equip_key, _caller_btn) {
	var _is_current = _current_obj != -1 && _current_obj != noone && object_exists(_current_obj) && _opt.obj == _current_obj;

	var _card = new LuiPanel()
		.setWidth(520)
		.setHeight(129)
		.setPadding(20)
		.setGap(10);
	_card.panel_sprite = spr_ui_equipment_element;

	var _root = new LuiRow();

	var _left = new LuiColumn().setWidth(90);
	var _icon = new LuiIcon({ value: _opt.icon, quality: _opt.quality, scale: 90 / 144 });
	_icon.setSize(90, 90);
	_icon.setPadding(0);
	_left.addContent(_icon);

	var _center = new LuiColumn().setGap(12);
	_center.addContent(new LuiText({ value: _opt.name }));
	_center.addContent(new LuiText({ value: Lang_GetString("ui.ability") + " " + _opt.ability }));

	var _right = new LuiColumn().setWidth(120).setPosition(5, 8);

	if (_is_current) {
		var _text = new LuiText({ value: Lang_GetString("ui.equipped"), width: 118, height: 73 });
		_text.setTextHalign(fa_center);
		_text.setTextValign(fa_middle);
		_text.color_override = c_green;
		_right.addContent(_text);
	} else {
		var _btn = new LuiButton({ text: Lang_GetString("ui.equip") }).setSize(118, 73);
		with (_btn) {
			draw = function() {
				var subimg = 0;
				if (self.is_pressed) {
					subimg = 1;
				} else if (self.isMouseHovered()) {
					subimg = 0;
				}
				draw_sprite(spr_ui_button, subimg, self.x, self.y);
				DrawSetText(make_color_rgb(0,65,140),,fa_center,fa_middle,1);
				DrawTextOutline(self.x + width / 2, self.y + height / 2 + subimg * 2 - 4, text, 2, make_color_rgb(57,162,225), 8);
				DrawSetText(c_white);
			}
		}show_message(_opt)
		_btn.data = {
			key: _equip_key,
			value: _opt.obj,
			name: _opt.name,
			asset_name: _opt.icon//_opt.asset_name ?? _opt.raw_name ?? ""
		};
		_btn.addEvent(LUI_EV_CLICK, function(_el) {
			var k = _el.data.key;
			var v = _el.data.value;
			if (k == "choicebosswave") {
				global.choicebosswave = asset_get_index("wave_boss_" + _el.data.asset_name);
			} else if (k == "wingman_left") {
				global.current_equipment.wingman_left = [v];
			} else if (k == "wingman_right") {
				global.current_equipment.wingman_right = [v];
			} else {
				variable_struct_set(global.current_equipment, k, v);
			}

			var _caller_btn = _el.data.caller_btn;
			_caller_btn.setText(_el.data.name);
			_caller_btn.current_obj = v;
			_refresh_preview();

			if (!is_undefined(global._current_equipment_select.window) && instance_exists(global._current_equipment_select.window)) {
				global._current_equipment_select.window.closeWindow();
			}
		});
		_right.addContent(_btn);
	}

	_root.addContent(_left);
	_root.addContent(_center);
	_root.addContent(_right);
	_card.addContent(_root);

	return _card;
}

function _create_equipment_selection_window() {
	var _options = global._current_equipment_select.options;
	var _current_obj = global._current_equipment_select.current_obj;
	var _equip_key = global._current_equipment_select.equip_key;
	var _placeholder = global._current_equipment_select.placeholder;
	var _caller_btn = global._current_equipment_select.caller_btn;

	if (!is_undefined(global._current_equipment_select.window) && instance_exists(global._current_equipment_select.window)) {
		global._current_equipment_select.window.closeWindow();
	}

	var _window = new LuiWindow({ title: _placeholder, width: 600, height: 500 });
	global._current_equipment_select.window = _window;
	var _gui_w = display_get_gui_width();
	var _gui_h = display_get_gui_height();
	_window.setPosX(max(0, (_gui_w - _window.width) * 0.5));
	_window.setPosY(max(0, (_gui_h - _window.height) * 0.5));

	var _scroll_panel = new LuiScrollPanel({ width: 560, height: 400 });
	var _options_column = new LuiColumn().setGap(8).setPadding(8);
	var _current_option_index = -1;

	for (var i = 0; i < array_length(_options); i++) {
		var _opt = _options[i];
		var _is_current = _current_obj != -1 && _current_obj != noone && object_exists(_current_obj) && _opt.obj == _current_obj;
		if (_is_current) {
			_current_option_index = i;
		}
		_options_column.addContent(_create_equipment_option_item(_opt, _current_obj, _equip_key, _caller_btn));
	}

	_scroll_panel.addContent(_options_column);
	_window.addContent(_scroll_panel);

	if (_current_option_index >= 0) {
		var _button_height = 129;
		var _gap = 8;
		var _padding = 8;
		var _scroll_position = (_button_height + _gap) * _current_option_index + _padding;
		_scroll_panel.scroll_target_offset_y = -_scroll_position + 135;
	}

	main_ui.addContent(_window);
}

_boss_objects = [];
var _all_objects = EquipmentSelect_GetEquipmentOptions(battle_wave, "wave_boss");
for (var i = 0; i < array_length(_all_objects); i++) {
	var _obj = _all_objects[i];
	var _obj_name = object_get_name(_obj.obj);
	if (string_pos("wave_boss_", _obj_name) == 1) {
		var _boss_name = string_delete(_obj_name, 1, 10);
		array_push(_boss_objects, {
			obj: _obj.obj,
			name: Lang_GetString("boss." + _boss_name),
			asset_name: _boss_name
		});
	}
}

if (array_length(_boss_objects) == 0) {
	array_push(_boss_objects, {
		obj: -1,
		name: "No boss",
		asset_name: ""
	});
}

_current_boss = variable_global_exists("choicebosswave") ? global.choicebosswave : -1;
_btn_boss = _make_equipment_button(_boss_objects, _current_boss, "choicebosswave", Lang_GetString("ui.select.boss"));

var _boss_hp_ratio_slider = new LuiSlider({
	value: variable_global_exists("boss_hp_ratio") ? global.boss_hp_ratio : 1.0,
	min_value: 0.5,
	max_value: 3.0,
	rounding: 0.1,
	width: 350,
	height: 24
});
_boss_hp_ratio_slider.addEvent(LUI_EV_VALUE_UPDATE, function(_el) {
	global.boss_hp_ratio = _el.get();
});

var _enemy_damage_ratio_slider = new LuiSlider({
	value: variable_global_exists("enemy_damage_ratio") ? global.enemy_damage_ratio : 1.0,
	min_value: 0.5,
	max_value: 3.0,
	rounding: 0.1,
	width: 350,
	height: 24
});
_enemy_damage_ratio_slider.addEvent(LUI_EV_VALUE_UPDATE, function(_el) {
	global.enemy_damage_ratio = _el.get();
});

var _current_plane = global.current_equipment.plane;
var _btn_plane = _make_equipment_button(_planes, _current_plane, "plane", Lang_GetString("ui.select.plane"));

var _wl = global.current_equipment.wingman_left;
var _current_wl = (is_array(_wl) && array_length(_wl) > 0) ? _wl[0] : -1;
var _btn_wingman_left = _make_equipment_button(_wingmans, _current_wl, "wingman_left", Lang_GetString("ui.select.wingman.left"));

var _wr = global.current_equipment.wingman_right;
var _current_wr = (is_array(_wr) && array_length(_wr) > 0) ? _wr[0] : -1;
var _btn_wingman_right = _make_equipment_button(_wingmans, _current_wr, "wingman_right", Lang_GetString("ui.select.wingman.right"));

var _current_sub = global.current_equipment.subweapon;
var _btn_subweapon = _make_equipment_button(_subweapons, _current_sub, "subweapon", Lang_GetString("ui.select.subweapon"));

var _current_armor = global.current_equipment.armor;
var _btn_armor = _make_equipment_button(_armors, _current_armor, "armor", Lang_GetString("ui.select.armor"));

var _btn_enter = new LuiButton({ text: "进入战斗", width: 200, height: 44 }).setFlexAlignSelf(flexpanel_align.center);
_btn_enter.addEvent(LUI_EV_CLICK, function(_el) {
	global.score = 0;
	global.hp_max = 10;
	global.hp = 10;
	if (!instance_exists(battle_loading)) {
		instance_create_depth(0, 0, 0, battle_loading);
	}
});

var _title = new LuiText({ value: Lang_GetString("ui.select.preparation") }).setTextHalign(fa_center);
var _row_boss = new LuiRow().addContent([
	new LuiText({ value: "Boss", width: 80 }),
	_btn_boss
]);
var _row_boss_hp = new LuiRow().addContent([
	new LuiText({ value: Lang_GetString("ui.boss.hp.ratio"), width: 180 }),
	_boss_hp_ratio_slider
]);
var _row_enemy_dmg = new LuiRow().addContent([
	new LuiText({ value: Lang_GetString("ui.enemy.damage.ratio"), width: 180 }),
	_enemy_damage_ratio_slider
]);
var _row_plane = new LuiRow().addContent([
	new LuiText({ value: Lang_GetString("ui.plane"), width: 80 }),
	_btn_plane
]);
var _row_wl = new LuiRow().addContent([
	new LuiText({ value: Lang_GetString("ui.wingman.left"), width: 80 }),
	_btn_wingman_left
]);
var _row_wr = new LuiRow().addContent([
	new LuiText({ value: Lang_GetString("ui.wingman.right"), width: 80 }),
	_btn_wingman_right
]);
var _row_sub = new LuiRow().addContent([
	new LuiText({ value: Lang_GetString("ui.subweapon"), width: 80 }),
	_btn_subweapon
]);
var _row_armor = new LuiRow().addContent([
	new LuiText({ value: Lang_GetString("ui.armor"), width: 80 }),
	_btn_armor
]);

var _enter_btn_container = new LuiContainer().setFlexAlignSelf(flexpanel_align.center);
_enter_btn_container.addContent(_btn_enter);

var _col = new LuiColumn().setPadding(8);
_col.addContent([_title, _row_boss, _row_boss_hp, _row_enemy_dmg, _row_plane, _row_wl, _row_wr, _row_sub, _row_armor, _enter_btn_container]);

var _panel = new LuiPanel({ width: 600, height: LUI_AUTO }).setPadding(16);
_panel.addContent(_col);
_panel.setPositionAbsolute();
_panel.setPosX((room_width - 600) / 2);
_panel.setPosY(540);

main_ui.addContent(_panel);

_refresh_preview();
*/