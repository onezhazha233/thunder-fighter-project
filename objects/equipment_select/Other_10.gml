live;
create_select_window = function(type){//0为战机 1为装甲 2为副武器 3为左僚机 4为右僚机 5为boss
	SFX_Play(snd_touch);
	window_select = new UIImage(spr_ui_list,0,360,640);
	window_select.center = true;
	window_select.nineslice = true;
	window_select.height = 1000;
	window_select.black = 0;
	window_select.alpha = 0.5;
	window_select.closing = false;
	window_select.close_finished = false;
	window_select.step = function(el){
		if(el.closing){
			if(el.close_finished)el.Destroy();
		}
		else{
			if(el.alpha <= 0)el.Destroy();
			el.active = (el.alpha == 1);
		}
	}
	window_select.AddEvent(UI_EVENT.CREATE,function(el){
		other.btn_select_plane.active = false;
		other.btn_select_armor.active = false;
		other.btn_select_subweapon.active = false;
		other.btn_select_wingman_left.active = false;
		other.btn_select_wingman_right.active = false;
		other.btn_select_boss.active = false;
		other.btn_start_battle.active = false;
		other.btn_settings.active = false;
	});
	window_select.AddEvent(UI_EVENT.DESTROY,function(el){
		other.btn_select_plane.active = true;
		other.btn_select_armor.active = true;
		other.btn_select_subweapon.active = true;
		other.btn_select_wingman_left.active = true;
		other.btn_select_wingman_right.active = true;
		other.btn_select_boss.active = true;
		other.btn_start_battle.active = true;
		other.btn_settings.active = true;
	});
	
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
	
	window_select_title = new UIText("{outline_color 0 65 140}{outline_thickness 2}"+Lang_GetString("ui.select."+et),360,20);
	window_select_title.halign = fa_center;
	window_select_title.scale_x = 1.5;
	window_select_title.scale_y = 1.5;
	
	list = new UIScrollPanel(30,80,655,870);
	list.content_gap = 16;
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
	    var card = create_equipment_item(equipments[i],type,selected,(type==5));
	    list.AddContent(card);
		if(selected = true)ii = i;
	}
	aa = clamp(-(ii-2)*145-5,max(-(array_length(equipments)*145-870),-array_length(equipments)*145),0);
	list.scroll_y = aa;

	var _intro_cards = list.children;
	var _intro_card_time = 10;
	var _intro_card_delay = 1;
	var _intro_card_offset = 700;
	var _intro_card_count = array_length(_intro_cards);
	var _intro_visible_count = 0;
	var _intro_content_y = list.content_gap;

	for (var i = 0; i < _intro_card_count; i++) {
		var _card = _intro_cards[i];
		var _card_top = _intro_content_y;
		var _card_bottom = _card_top + _card.height;
		_intro_content_y += _card.height + list.content_gap;

		var _visible_top = -list.scroll_y;
		var _visible_bottom = _visible_top + list.height;
		if (_card_bottom <= _visible_top || _card_top >= _visible_bottom) {
			continue;
		}

		_card.x += _intro_card_offset;
		Anim_Create(_card, "x", ANIM_TWEEN.QUAD, ANIM_EASE.OUT, _card.x, -_intro_card_offset, _intro_card_time, _intro_visible_count * _intro_card_delay);
		_intro_visible_count++;
	}

	var _intro_total_time = _intro_card_time + max(_intro_visible_count - 1, 0) * _intro_card_delay;
	Anim_Create(window_select,"active",0,0,0,1,0,_intro_total_time);
	Anim_Create(window_select,"alpha",0,0,window_select.alpha,1-window_select.alpha,_intro_total_time);
	Anim_Create(window_select,"black",0,0,0,0.5,_intro_total_time);

	closebtn = new UIButton(spr_ui_button_close,602,17);
	closebtn.list = list;
	closebtn.AddEvent(UI_EVENT.CLICK,function(el){
		SFX_Play(snd_touch);
		var _window = el.parent;
		if(_window.closing) return;
		_window.closing = true;
		_window.close_finished = false;
		_window.active = false;
		el.active = false;

		var _exit_cards = el.list.children;
		var _exit_card_time = 10;
		var _exit_card_delay = 1;
		var _exit_card_offset = 700;
		var _exit_card_count = array_length(_exit_cards);
		var _exit_visible_count = 0;
		var _exit_content_y = el.list.content_gap;

		for (var i = 0; i < _exit_card_count; i++) {
			var _card = _exit_cards[i];
			var _card_top = _exit_content_y;
			var _card_bottom = _card_top + _card.height;
			_exit_content_y += _card.height + el.list.content_gap;

			var _visible_top = -el.list.scroll_y;
			var _visible_bottom = _visible_top + el.list.height;
			if (_card_bottom <= _visible_top || _card_top >= _visible_bottom) {
				continue;
			}

			Anim_Create(_card, "x", ANIM_TWEEN.QUAD, ANIM_EASE.IN, _card.x, _exit_card_offset, _exit_card_time, _exit_visible_count * _exit_card_delay);
			_exit_visible_count++;
		}

		var _exit_total_time = _exit_card_time + max(_exit_visible_count - 1, 0) * _exit_card_delay;
		Anim_Create(_window,"alpha",0,0,_window.alpha,-_window.alpha,_exit_total_time,0,function(){
			self.close_finished = true;
		});
		Anim_Create(_window,"black",0,0,_window.black,-_window.black,_exit_total_time);
	});
	
	window_select.AddContent(list);
	window_select.AddContent(window_select_title);
	window_select.AddContent(closebtn);
	main_ui.AddContent(window_select);
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
	
create_equipment_item = function(data,type,selected=false,boss=false){
	var panel = new UIImage(spr_ui_equipment_element,0,0,0);
	equipment_icon = new UIImage(spr_icon_alloy_a,0,20,20);
	equipment_icon.width = 90;
	equipment_icon.height = 90;
	equipment_icon.spr = data.icon;
	equipment_icon.quality = data.quality;
	equipment_icon.draw = function(el){
		draw_icon(el.abs_x,el.abs_y,el.spr,el.quality,90*el.abs_scale_x,el.abs_alpha);
	}
	equipment_text = new UIText("",140,25);
	equipment_text.text = data.name;
	if(boss = false)equipment_text.text += "\n"+Lang_GetString("ui.ability")+" "+ data.ability;
	equipment_text.height = 80;
	equipment_text.char_spacing = 2;
	equipment_text.line_spacing = 40;
	
	if(selected = true){
		equip_btn = new UIText("{color green}"+Lang_GetString("ui."+(boss = true ? "selected" : "equipped")),542,46);
	}
	else{
		equip_btn = new UIButton(spr_ui_button,522,28);
		equip_btn.text = "{color_rgb 0 65 140}{outline_color 57 162 225}{outline_thickness 2}"+Lang_GetString("ui."+(boss = true ? "select" : "equip"));
		equip_btn.text_x = 33;
		equip_btn.text_y = 20;
		equip_btn.equipment_name = data.icon;
		if(variable_struct_exists(data,"obj"))equip_btn.equipment_name = data.obj;
		equip_btn.type = type;
		equip_btn.boss = boss;
		equip_btn.AddEvent(UI_EVENT.CLICK,function(el){
			if(el.boss = false){
				te = other.equipment_name2obj(el.equipment_name,el.type);
			}
			else{
				te = el.equipment_name;
			}
			if(el.type = 0){
				global.current_equipment.plane = te;
				Flag_Set(FLAG_STATIC,"player_plane",object_get_name(te));
			}
			if(el.type = 1){
				global.current_equipment.armor = te;
				Flag_Set(FLAG_STATIC,"player_armor",object_get_name(te));
			}
			if(el.type = 2){
				global.current_equipment.subweapon = te;
				Flag_Set(FLAG_STATIC,"player_subweapon",object_get_name(te));
			}
			if(el.type = 3){
				global.current_equipment.wingman_left[0] = te;
				Flag_Set(FLAG_STATIC,"player_wingman_left",object_get_name(te));
			}
			if(el.type = 4){
				global.current_equipment.wingman_right[0] = te;
				Flag_Set(FLAG_STATIC,"player_wingman_right",object_get_name(te));
			}
			if(el.type = 5){
				global.choicebosswave = te;
				Flag_Set(FLAG_STATIC,"current_boss_wave",object_get_name(te));
			}
			Flag_Save(FLAG_STATIC);
			with(other.closebtn)CallEvent(UI_EVENT.CLICK);
			other.refresh_preview();
		});
	}
	
	panel.AddContent(equipment_icon);
	panel.AddContent(equipment_text);
	panel.AddContent(equip_btn);
	
	return panel;
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
		preview_inst.SetRampage(false);
	}
	alarm[0] = 3;
}
