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
	.setSprites(spr_ui_list, spr_ui_button_flat)
	.setSpriteCheckbox(sUI_button, sUI_checkbox_pin)
	.setSpriteToggleSwitch(sToggleSwitch, sToggleSwitchSlider)
	.setSpriteComboBoxArrow(sUI_ComboBoxArrow)
	.setSpriteRing(sRing, sRing)
	.setSpriteScrollSlider(sUI_Square_6r, sUI_Square_6r)
	.setColors(c_white,c_white,c_white,c_white)
	.setColorAccent(#64d0b9)
	.setColorHover(c_white)
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
button_startbattle.flat = true
button_startbattle.addEvent(LUI_EV_CLICK, function(_el) {
	global.score = 0;
	global.hp_max = 10;
	global.hp = 10;
	if (!instance_exists(battle_loading)) {
		instance_create_depth(0,0,0,battle_loading);
	}
});

button_settings = new LuiButton({width: 80, height: 80})
button_settings.flat = true
button_settings.icon.sprite = spr_ui_icon_settings
button_settings.x += 460
button_settings.y -= 30
button_settings.addEvent(LUI_EV_CLICK, function(_el) {
	window_settings = new LuiPanel()
	.setSize(720,400)
	window_settings.black_alpha = 0;
	array_push(main_ui.pre_draw_list,window_settings);
	with(window_settings){
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
	window_settings.addEvent(LUI_EV_CREATE,function(_el){
		main_window.deactivate();
	})
	window_settings.addEvent(LUI_EV_DESTROY,function(_el){
		main_window.activate();
	})
	window_settings_title = new LuiText({height: 50})
	.setText(Lang_GetString("ui.settings"))
	.setTextHalign(fa_center)
	window_settings_title.text_scale = 1.4;
	window_settings_title.text_outline = true;
	window_settings_title.text_outline_width = 2;
	window_settings_title.text_outline_color = make_color_rgb(0,65,140);
	window_settings.addContent(window_settings_title);
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
		window_settings.destroy();
	})
	window_settings.addContent(closebtn);
	
	music_icon = new LuiImage({value: spr_ui_icon_music, color: make_color_rgb(48,159,236), width: 60, height: 60});
	music_icon.x += 30;
	music_icon.y += 20;
	music_switch = new LuiImageButton({value: spr_ui_switch, width: 158, height: 93});
	music_switch.subimg = Flag_Get(FLAG_SETTINGS,"music");
	music_switch.x += 30;
	music_switch.press_black = false;
	music_switch.addEvent(LUI_EV_CLICK,function(_el){
		_el.subimg = !_el.subimg;
		Flag_Set(FLAG_SETTINGS,"music",_el.subimg);
		Flag_Save(FLAG_SETTINGS);
	})
	
	sound_icon = new LuiImage({value: spr_ui_icon_sound, color: make_color_rgb(48,159,236), width: 60, height: 60});
	sound_icon.x += 30+80;
	sound_icon.y += 20;
	sound_switch = new LuiImageButton({value: spr_ui_switch, width: 158, height: 93});
	sound_switch.subimg = Flag_Get(FLAG_SETTINGS,"sound");
	sound_switch.x += 30+80;
	sound_switch.press_black = false;
	sound_switch.addEvent(LUI_EV_CLICK,function(_el){
		_el.subimg = !_el.subimg;
		Flag_Set(FLAG_SETTINGS,"sound",_el.subimg);
		Flag_Save(FLAG_SETTINGS);
		if(_el.subimg = 1)alarm[0] = 1;
	})
	settings_row0 = new LuiRow();
	settings_row0.addContent(music_icon);
	settings_row0.addContent(music_switch);
	settings_row0.addContent(sound_icon);
	settings_row0.addContent(sound_switch);
	
	boss_hp_ratio_text = new LuiText({value: Lang_GetString("ui.boss.hp.ratio")});
	boss_hp_ratio_text.x += 30;
	boss_hp_ratio = new LuiSlider({
		value: Flag_Get(FLAG_SETTINGS,"boss_hp_ratio",1),
	    min_value: 0.5,
	    max_value: 3.0,
	    rounding: 0.1,
	    width: 300,
	    height: 24
	});
	boss_hp_ratio.x -= 160;
	with(boss_hp_ratio){
		draw = function(){
			draw_sprite_stretched(spr_ui_slider_bg,0,x,y,width,36);
			draw_sprite_stretched(spr_ui_slider_bar,0,x+8,y+9,bar_value*width-16,18);
			draw_sprite(spr_ui_slider_knob,0,x+bar_value*width,y+18);
			draw_text(x+330,y+16,value);
		}
	}
	boss_hp_ratio.addEvent(LUI_EV_VALUE_UPDATE, function(_el){
		Flag_Set(FLAG_SETTINGS,"boss_hp_ratio",_el.get());
		Flag_Save(FLAG_SETTINGS);
	});
	settings_row1 = new LuiRow();
	settings_row1.addContent([boss_hp_ratio_text,boss_hp_ratio]);
	
	enemy_damage_ratio_text = new LuiText({value: Lang_GetString("ui.enemy.damage.ratio")});
	enemy_damage_ratio_text.x += 30;
	enemy_damage_ratio = new LuiSlider({
		value: Flag_Get(FLAG_SETTINGS,"enemy_damage_ratio",1),
	    min_value: 0.5,
	    max_value: 3.0,
	    rounding: 0.1,
	    width: 300,
	    height: 24
	});
	enemy_damage_ratio.x -= 160;
	with(enemy_damage_ratio){
		draw = function(){
			draw_sprite_stretched(spr_ui_slider_bg,0,x,y,width,36);
			draw_sprite_stretched(spr_ui_slider_bar,0,x+8,y+9,bar_value*width-16,18);
			draw_sprite(spr_ui_slider_knob,0,x+bar_value*width,y+18);
			draw_text(x+330,y+16,value);
		}
	}
	enemy_damage_ratio.addEvent(LUI_EV_VALUE_UPDATE, function(_el){
		Flag_Set(FLAG_SETTINGS,"enemy_damage_ratio",_el.get());
		Flag_Save(FLAG_SETTINGS);
	});

	settings_row2 = new LuiRow();
	settings_row2.addContent([enemy_damage_ratio_text,enemy_damage_ratio]);
	
	window_settings.addContent([settings_row0,settings_row1,settings_row2]);
	
	main_ui.addContent(window_settings);
})

select_row0.addContent([select_equipment_plane,select_equipment_armor,select_equipment_subweapon])
select_row1.addContent([select_equipment_wingman_left,select_equipment_wingman_right])
main_window.addContent([select_row0,select_row1])
main_window.addContent(button_select_boss)
main_window.addContent(button_startbattle)
main_window.addContent(button_settings)

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
	list.draw_scroll_bar = false;

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

create_equipment_item = function(data,type,selected=false,boss=false){
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
			if(_el.type = 0){
				global.current_equipment.plane = te;
				Flag_Set(FLAG_STATIC,"player_plane",object_get_name(te));
			}
			if(_el.type = 1){
				global.current_equipment.armor = te;
				Flag_Set(FLAG_STATIC,"player_armor",object_get_name(te));
			}
			if(_el.type = 2){
				global.current_equipment.subweapon = te;
				Flag_Set(FLAG_STATIC,"player_subweapon",object_get_name(te));
			}
			if(_el.type = 3){
				global.current_equipment.wingman_left[0] = te;
				Flag_Set(FLAG_STATIC,"player_wingman_left",object_get_name(te));
			}
			if(_el.type = 4){
				global.current_equipment.wingman_right[0] = te;
				Flag_Set(FLAG_STATIC,"player_wingman_right",object_get_name(te));
			}
			if(_el.type = 5){
				global.choicebosswave = te;
				Flag_Set(FLAG_STATIC,"current_boss_wave",object_get_name(te));
			}
			Flag_Save(FLAG_STATIC);
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

refresh_preview = function(){
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