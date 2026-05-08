live;
depth = -100;
preview_inst = noone

list = -1

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

//luiNextDebugMode()

main_window = new LuiPanel()
main_window.panel_sprite = spr_ui_selectpanel
main_window.setPositionAbsolute()
main_window.setSize(588,697)
main_window.y = 500

var _gui_w = 720
var _pos_x = max(0, (_gui_w - main_window.width) * 0.5);
main_window.x = _pos_x;

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
	step = function(){
		updateMainUiSurface();
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

button_select_armor = new LuiButton()
with(button_select_armor){
	x -= 9;
	y -= 9;
	width = 144;
	height = 144;
	draw = function(){
		spr = other.equipment_obj2name(global.current_equipment.armor);
		draw_icon(x,y,spr);
	}
	step = function(){
		updateMainUiSurface();
	}
}
button_select_armor.addEvent(LUI_EV_CLICK,function(_el){
	create_select_window(1);
})
select_equipment_armor.addContent(button_select_armor)

select_equipment_subweapon = new LuiPanel()
select_equipment_subweapon.panel_sprite = spr_ui_selectequipment
select_equipment_subweapon.setSize(156,172)
.x += 28

button_select_subweapon = new LuiButton()
with(button_select_subweapon){
	x -= 9;
	y -= 9;
	width = 144;
	height = 144;
	draw = function(){
		spr = other.equipment_obj2name(global.current_equipment.subweapon);
		draw_icon(x,y,spr);
	}
	step = function(){
		updateMainUiSurface();
	}
}
button_select_subweapon.addEvent(LUI_EV_CLICK,function(_el){
	create_select_window(2);
})
select_equipment_subweapon.addContent(button_select_subweapon)

select_equipment_wingman_left = new LuiPanel()
select_equipment_wingman_left.panel_sprite = spr_ui_selectequipment
select_equipment_wingman_left.setSize(156,172)
.x += 114

button_select_wingman_left = new LuiButton()
with(button_select_wingman_left){
	x -= 9;
	y -= 9;
	width = 144;
	height = 144;
	draw = function(){
		spr = other.equipment_obj2name(global.current_equipment.wingman_left[0]);
		draw_icon(x,y,spr);
	}
	step = function(){
		updateMainUiSurface();
	}
}
button_select_wingman_left.addEvent(LUI_EV_CLICK,function(_el){
	create_select_window(3);
})
select_equipment_wingman_left.addContent(button_select_wingman_left)

select_equipment_wingman_right = new LuiPanel()
select_equipment_wingman_right.panel_sprite = spr_ui_selectequipment
select_equipment_wingman_right.setSize(156,172)
.x += 114

button_select_wingman_right = new LuiButton()
with(button_select_wingman_right){
	x -= 9;
	y -= 9;
	width = 144;
	height = 144;
	draw = function(){
		spr = other.equipment_obj2name(global.current_equipment.wingman_right[0]);
		draw_icon(x,y,spr);
	}
	step = function(){
		updateMainUiSurface();
	}
}
button_select_wingman_right.addEvent(LUI_EV_CLICK,function(_el){
	create_select_window(4);
})
select_equipment_wingman_right.addContent(button_select_wingman_right)

button_select_boss = new LuiButton({text: Lang_GetString("ui.select.boss")}).setSize(300,56);
button_select_boss.setFlexAlignSelf(flexpanel_align.center)
.y += 60

button_select_boss.addEvent(LUI_EV_CLICK,function(_el){
	create_select_window(5);
})
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
button_startbattle.addEvent(LUI_EV_CLICK, function(_el) {
	global.score = 0;
	global.hp_max = 10;
	global.hp = 10;
	if (!instance_exists(battle_loading)) {
		instance_create_depth(0,0,0,battle_loading);
	}
});
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

refresh_preview()

if (!variable_global_exists("equipment_select_new_anim")) {
	global.equipment_select_new_anim = {
		set_mouse_block: function(_element, _blocked) {
			if (is_undefined(_element) || _element.is_destroyed) return;
			_element.ignore_mouse = _blocked;
			_element.ignore_mouse_all = _blocked ? true : undefined;
			if (is_array(_element.content)) {
				for (var i = 0; i < array_length(_element.content); i++) {
					global.equipment_select_new_anim.set_mouse_block(_element.content[i], _blocked);
				}
			}
		},
		capture_base_tree: function(_element) {
			if (is_undefined(_element) || _element.is_destroyed) return;
			_element.intro_base_x = _element.x;
			if (is_array(_element.content)) {
				for (var i = 0; i < array_length(_element.content); i++) {
					global.equipment_select_new_anim.capture_base_tree(_element.content[i]);
				}
			}
		},
		apply_offset_tree: function(_element, _offset_x) {
			if (is_undefined(_element) || _element.is_destroyed) return;
			if (!variable_struct_exists(_element, "intro_base_x")) {
				_element.intro_base_x = _element.x;
			}
			_element.x = _element.intro_base_x + _offset_x;
			if (is_array(_element.content)) {
				for (var i = 0; i < array_length(_element.content); i++) {
					global.equipment_select_new_anim.apply_offset_tree(_element.content[i], _offset_x);
				}
			}
		},
		animate_tree_x: function(_element, _duration, _delay, _on_complete = undefined) {
			if (is_undefined(_element) || _element.is_destroyed) return;
			if (!variable_struct_exists(_element, "intro_base_x")) {
				_element.intro_base_x = _element.x;
			}
			Anim_Create(_element, "x", ANIM_TWEEN.QUAD, ANIM_EASE.OUT, _element.x, _element.intro_base_x - _element.x, _duration, _delay, _on_complete);
			if (is_array(_element.content)) {
				for (var i = 0; i < array_length(_element.content); i++) {
					global.equipment_select_new_anim.animate_tree_x(_element.content[i], _duration, _delay);
				}
			}
		},
		finish_card: function(_card) {
			if (is_undefined(_card) || _card.is_destroyed) return;
			if (is_undefined(_card.intro_window) || _card.intro_window.is_destroyed) return;
			_card.intro_window.intro_remaining--;
			if (_card.intro_window.intro_remaining <= 0 && !_card.intro_window.intro_finished) {
				_card.intro_window.intro_finished = true;
				global.equipment_select_new_anim.set_mouse_block(_card.intro_window, false);
				_card.intro_window.updateMainUiSurface();
			}
		}
	};
}

create_select_window = function(type){//0为战机 1为装甲 2为副武器 3为左僚机 4为右僚机 5为boss
	window_select = new LuiPanel()
	.setSize(720,1000)
	window_select.y += 50
	window_select.black_alpha = 0;
	with(window_select){
		preDraw = function(){
			if!(is_destroyed){
				black_alpha += (0.5-black_alpha)/3;
			}
			else{
				black_alpha += (0-black_alpha)/3;
			}
			draw_sprite_ext(spr_pixel2x,0,room_width/2,room_height/2,room_width/2,room_height/2,0,0,black_alpha);
		}
	}
	window_select.addEvent(LUI_EV_CREATE,function(_el){
		main_window.deactivate();
	})
	window_select.addEvent(LUI_EV_DESTROY,function(_el){
		main_window.activate();
	})
	array_push(main_ui.pre_draw_list,window_select);
	window_select.intro_frame = 0;
	window_select.intro_duration = 10;
	window_select.intro_shift = 700;
	window_select.intro_initialized = false;
	window_select.intro_finished = false;
	window_select.intro_cards = [];
	window_select.intro_scroll_panel = undefined;
	window_select.ignore_mouse_all = true;
	window_select.ignore_mouse = true;

	if(type = 0){
		et = "plane";
		equipments = Equipment_Plane();
		current_equipment = global.current_equipment.plane;
	}
	if(type = 1){
		et = "armor";
		equipments = Equipment_Armor();
		current_equipment = global.current_equipment.armor;
	}
	if(type = 2){
		et = "subweapon";
		equipments = Equipment_Subweapon();
		current_equipment = global.current_equipment.subweapon;
	}
	if(type = 3){
		et = "wingman.left";
		current_equipment = global.current_equipment.wingman_left[0];
	}
	if(type = 4){
		et = "wingman.right";
		current_equipment = global.current_equipment.wingman_right[0];
	}
	if(type = 3||type = 4)equipments = Equipment_Wingman();
	if(type = 5){
		et = "boss";
		equipments = BossList();
		current_equipment = global.choicebosswave;
	}
	
	window_select_title = new LuiText({height: 50})
	.setText(Lang_GetString("ui.select."+et))
	.setTextHalign(fa_center)
	window_select_title.text_scale = 1.4;
	window_select_title.text_outline = true;
	window_select_title.text_outline_width = 2;
	window_select_title.text_outline_color = make_color_rgb(0,65,140);

	tr = new LuiRow().addContent(window_select_title);
	tl = new LuiRow();
	list = new LuiScrollPanel();
	list.setSize(675,880);
	list.draw_base = false;

	var ii = -1;
	for (var i = 0; i < array_length(equipments); i++) {
		nn = equipments[i].icon;
		if(variable_struct_exists(equipments[i],"obj"))nn = equipments[i].obj;
		if(type = 5){
			selected = (current_equipment==equipments[i].obj);
		}
		else{
			selected = (equipment_obj2name(current_equipment,false)==nn);
		}
	    var _card = create_equipment_item(equipments[i],type,selected,(type==5));
	    list.addContent(_card);
	    array_push(window_select.intro_cards, _card);
		if(selected = true)ii = i;
	}
	
	aa = clamp(-(ii-2)*145, -(array_length(equipments)*145+16 - 800-80), 0);
	list.scroll_target_offset_y = aa;
	list.scroll_offset_y = aa;
	list._applyScroll();

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

	window_select.intro_scroll_panel = list;
	with (window_select) {
		preDraw = function() {
			if!(is_destroyed){
				black_alpha += (0.5-black_alpha)/3;
			}
			else{
				black_alpha += (0-black_alpha)/3;
			}
			draw_sprite_ext(spr_pixel2x,0,room_width/2,room_height/2,room_width/2,room_height/2,0,0,black_alpha);

			if (self.is_destroyed || self.intro_initialized) return;

			var _scroll_top = self.intro_scroll_panel.y;
			var _scroll_bottom = self.intro_scroll_panel.y + self.intro_scroll_panel.height;
			var _visible_cards = [];
			for (var i = 0; i < array_length(self.intro_cards); i++) {
				var _card = self.intro_cards[i];
				if (is_undefined(_card) || _card.is_destroyed) continue;
				if (_card.y + _card.height < _scroll_top || _card.y > _scroll_bottom) continue;
				array_push(_visible_cards, _card);
			}

			array_sort(_visible_cards, function(_a, _b) {
				if (_a.y == _b.y) return _a.x - _b.x;
				return _a.y - _b.y;
			});

			if (array_length(_visible_cards) == 0) {
				self.intro_initialized = true;
				self.intro_finished = true;
				global.equipment_select_new_anim.set_mouse_block(self, false);
				return;
			}

			self.intro_remaining = array_length(_visible_cards);
			for (var i = 0; i < array_length(_visible_cards); i++) {
				var _card = _visible_cards[i];
				_card.intro_window = self;
				global.equipment_select_new_anim.capture_base_tree(_card);
				global.equipment_select_new_anim.apply_offset_tree(_card, self.intro_shift);
				global.equipment_select_new_anim.animate_tree_x(_card, self.intro_duration, i, _card.intro_anim_done);
			}

			self.intro_initialized = true;
			self.intro_finished = false;
			self.updateMainUiSurface();
		}
	}
}

function create_equipment_item(data,type,selected=false,boss=false) {
    var rootp = new LuiPanel()
		.setWidth(657)
        .setHeight(129)
        .setPadding(20)
        .setGap(10)
	rootp.panel_sprite = spr_ui_equipment_element;
	var root = new LuiRow();
	with(rootp){
		intro_window = undefined;
		intro_anim_done = function() {
			global.equipment_select_new_anim.finish_card(self);
		}
	}

    /// 左：头像
    var left = new LuiColumn()
        .setWidth(90)
	
	equipment_icon = new LuiIcon({value: data.icon, quality: data.quality});
	equipment_icon.setSize(90,90);
	equipment_icon.setPadding(0);
    left.addContent(equipment_icon);

    /// 中：文字信息
    var center = new LuiColumn()
        .setGap(12);

    center.addContent(new LuiText({value:data.name}));
    if(boss = false)center.addContent(new LuiText({value: Lang_GetString("ui.ability")+" "+ data.ability}));

    /// 右：按钮或状态
    var right = new LuiColumn()
        .setWidth(120)
		.setPosition(5,8);
	if(selected = true){
		btn = new LuiText({value: Lang_GetString("ui."+(boss = true ? "selected" : "equipped")), x:20, y: 17});
		btn.color_override=c_green;
	}
	else{
		btn = new LuiButton({text: Lang_GetString("ui."+(boss = true ? "select" : "equip"))}).setSize(118,73);
		btn.equipment_name = data.icon;
		if(variable_struct_exists(data,"obj"))btn.equipment_name = data.obj;
		btn.type = type;
		btn.boss = boss;
		btn.addEvent(LUI_EV_CLICK,function(_el){
			if(_el.boss = false){
				te = equipment_name2obj(_el.equipment_name,_el.type);
			}
			else{
				te = _el.equipment_name;
			}
			if(_el.type = 0)global.current_equipment.plane = te;
			if(_el.type = 1)global.current_equipment.armor = te;
			if(_el.type = 2)global.current_equipment.subweapon = te;
			if(_el.type = 3)global.current_equipment.wingman_left[0] = te;
			if(_el.type = 4)global.current_equipment.wingman_right[0] = te;
			if(_el.type = 5)global.choicebosswave = te;
			window_select.destroy();
			refresh_preview();
			main_window.activate();
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

equipment_obj2name = function(obj,filter=true){
	var name;
	if!(is_string(obj)){
		name = object_get_name(obj);
	}
	else{
		name = obj;
	}
	str = string_copy(name,string_pos("_",name)+1,999);
	if(filter = true){
		str = string_replace(str,"_c0","_c");
		str = string_replace(str,"_c123","_c");
	}
	return str;
}

equipment_name2obj = function(name,type){
	var prefix;
	if(type = 0)prefix = "plane_";
	if(type = 1)prefix = "armor_";
	if(type = 2)prefix = "subweapon_";
	if(type >= 3)prefix = "wingman_";
	
	return asset_get_index(prefix+name);
}

function refresh_preview(){
	var px = room_width/2;
	var py = 320;
	var sc = 1;
	if!(instance_exists(preview_inst)){
		preview_inst = instance_create_depth(px,py,0,equipment_agent);
		preview_inst.player_point_enabled = false;
		preview_inst.enabled = false;
		preview_inst.xscale = sc;
		preview_inst.yscale = sc;
		preview_inst.angle = 0;
		preview_inst.plane = global.current_equipment.plane;
		preview_inst.wingman_left = global.current_equipment.wingman_left;
		preview_inst.wingman_right = global.current_equipment.wingman_right;
		preview_inst.wingman_x_offset = global.current_equipment.wingman_x_offset;
		preview_inst.wingman_y_offset = global.current_equipment.wingman_y_offset;
		preview_inst.subweapon = global.current_equipment.subweapon;
		preview_inst.armor = global.current_equipment.armor;
		preview_inst.alarm[0] = 1;
		preview_inst.depth = 0;
		preview_inst.SetPosition(px, py);
	}
	else{
		preview_inst.plane = global.current_equipment.plane;
		preview_inst.wingman_left = global.current_equipment.wingman_left;
		preview_inst.wingman_right = global.current_equipment.wingman_right;
		preview_inst.wingman_x_offset = global.current_equipment.wingman_x_offset;
		preview_inst.wingman_y_offset = global.current_equipment.wingman_y_offset;
		preview_inst.subweapon = global.current_equipment.subweapon;
		preview_inst.armor = global.current_equipment.armor;
		preview_inst.alarm[0] = 1;
	}
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
