live;
depth = -100;
preview_inst = noone
event_user(0)

main_ui = new UIBase(0,0,720,1280)

main_window = new UIImage(spr_ui_selectpanel,0,360,850)
main_window.center = true
main_window.scale_x = 0.9
main_window.scale_y = 0.9
main_window.alpha = 0.5
main_window.active = false
main_window.black = 0;
Anim_Create(main_window,"active",0,0,0,1,0,20)
Anim_Create(main_window,"alpha",0,0,0.5,0.5,10)
Anim_Create(main_window,"scale_x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.95,0.06,10)
Anim_Create(main_window,"scale_y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.95,0.06,10)
Anim_Create(main_window,"scale_x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,1.01,-0.01,10,10)
Anim_Create(main_window,"scale_y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,1.01,-0.01,10,10)

window_title = new UIText(Lang_GetString("ui.select.preparation"),588/2,40)
window_title.halign = fa_center
window_title.scale_x = 1.5
window_title.scale_y = 1.5

select_equipment_plane = new UIImage(spr_ui_selectequipment,0,43,100)
select_equipment_armor = new UIImage(spr_ui_selectequipment,0,215,100)
select_equipment_subweapon = new UIImage(spr_ui_selectequipment,0,387,100)
select_equipment_wingman_left = new UIImage(spr_ui_selectequipment,0,130,308)
select_equipment_wingman_right = new UIImage(spr_ui_selectequipment,0,300,308)

btn_select_plane = new UIImage(spr_icon_alloy_a,0,6,6)
btn_select_plane.width = 144
btn_select_plane.height = 144
btn_select_plane.draw = function(el){
	spr = other.equipment_obj2name(global.current_equipment.plane);
	draw_icon(el.abs_x,el.abs_y,spr,,144*el.abs_scale_x,el.abs_alpha);
}
btn_select_plane.AddEvent(UI_EVENT.CLICK,function(){
	other.create_select_window(0);
})
select_equipment_plane.AddContent(btn_select_plane)

btn_select_armor = new UIImage(spr_icon_alloy_a,0,6,6)
btn_select_armor.width = 144
btn_select_armor.height = 144
btn_select_armor.draw = function(el){
	spr = other.equipment_obj2name(global.current_equipment.armor);
	draw_icon(el.abs_x,el.abs_y,spr,,144*el.abs_scale_x,el.abs_alpha);
}
btn_select_armor.AddEvent(UI_EVENT.CLICK,function(){
	other.create_select_window(1);
})
select_equipment_armor.AddContent(btn_select_armor)

btn_select_subweapon = new UIImage(spr_icon_alloy_a,0,6,6)
btn_select_subweapon.width = 144
btn_select_subweapon.height = 144
btn_select_subweapon.draw = function(el){
	spr = other.equipment_obj2name(global.current_equipment.subweapon);
	draw_icon(el.abs_x,el.abs_y,spr,,144*el.abs_scale_x,el.abs_alpha);
}
btn_select_subweapon.AddEvent(UI_EVENT.CLICK,function(){
	other.create_select_window(2);
})
select_equipment_subweapon.AddContent(btn_select_subweapon)

btn_select_wingman_left = new UIImage(spr_icon_alloy_a,0,6,6)
btn_select_wingman_left.width = 144
btn_select_wingman_left.height = 144
btn_select_wingman_left.draw = function(el){
	spr = other.equipment_obj2name(global.current_equipment.wingman_left[0]);
	draw_icon(el.abs_x,el.abs_y,spr,,144*el.abs_scale_x,el.abs_alpha);
}
btn_select_wingman_left.AddEvent(UI_EVENT.CLICK,function(){
	other.create_select_window(3);
})
select_equipment_wingman_left.AddContent(btn_select_wingman_left)

btn_select_wingman_right = new UIImage(spr_icon_alloy_a,0,6,6)
btn_select_wingman_right.width = 144
btn_select_wingman_right.height = 144
btn_select_wingman_right.draw = function(el){
	spr = other.equipment_obj2name(global.current_equipment.wingman_right[0]);
	draw_icon(el.abs_x,el.abs_y,spr,,144*el.abs_scale_x,el.abs_alpha);
}
btn_select_wingman_right.AddEvent(UI_EVENT.CLICK,function(){
	other.create_select_window(4);
})
select_equipment_wingman_right.AddContent(btn_select_wingman_right)

btn_select_boss = new UIButton(spr_ui_selectboss,144,515)
btn_select_boss.text = "{color_rgb 125 12 154}{outline_color 233 143 255}{outline_thickness 2}"+Lang_GetString("ui.select.boss")
btn_select_boss.text_x = 94
btn_select_boss.text_y = 12
btn_select_boss.AddEvent(UI_EVENT.CLICK,function(){
	other.create_select_window(5);
})

btn_start_battle = new UIButton(spr_ui_button_flat,224,586,140,56)
btn_start_battle.nineslice = true
btn_start_battle.text = "{color_rgb 0 65 140}{outline_color 100 180 250}{outline_thickness 2}"+Lang_GetString("ui.startbattle")
btn_start_battle.text_x = 18
btn_start_battle.text_y = 12
btn_start_battle.AddEvent(UI_EVENT.CLICK,function(){
	SFX_Play(snd_touch);
	global.score = 0;
	global.hp_max = 10;
	global.hp = 10;
	if (!instance_exists(battle_loading)) {
		instance_create_depth(0,0,0,battle_loading);
	}
})

btn_settings = new UIButton(spr_ui_button_flat,470,570,80,80)
btn_settings.nineslice = true
btn_settings.draw = function(el){
	with(el){
		draw_sprite_nineslice(sprite,is_pressed,abs_x,abs_y,width,height,abs_scale_x,abs_scale_y,nineslice_mode,-1,abs_alpha);
		draw_sprite(spr_ui_icon_settings,0,abs_x+40*abs_scale_x,abs_y+40*abs_scale_x+press_offset*abs_scale_y*is_pressed);
	}
}
btn_settings.AddEvent(UI_EVENT.CLICK,function(){
	SFX_Play(snd_touch);
	window_settings = new UIImage(spr_ui_list,0,360,640);
	window_settings.center = true;
	window_settings.nineslice = true;
	window_settings.height = 500;
	window_settings.scale_x = 0.9
	window_settings.scale_y = 0.9
	window_settings.black = 0;
	window_settings.alpha = 0.5;
	window_settings.closing = false;
	window_settings.close_finished = false;
	window_settings.step = function(el){
		if(el.alpha <= 0)el.Destroy();
		el.active = (el.alpha == 1);
	}
	window_settings.AddEvent(UI_EVENT.CREATE,function(el){
		other.btn_select_plane.active = false;
		other.btn_select_armor.active = false;
		other.btn_select_subweapon.active = false;
		other.btn_select_wingman_left.active = false;
		other.btn_select_wingman_right.active = false;
		other.btn_select_boss.active = false;
		other.btn_start_battle.active = false;
		other.btn_settings.active = false;
	});
	window_settings.AddEvent(UI_EVENT.DESTROY,function(el){
		other.btn_select_plane.active = true;
		other.btn_select_armor.active = true;
		other.btn_select_subweapon.active = true;
		other.btn_select_wingman_left.active = true;
		other.btn_select_wingman_right.active = true;
		other.btn_select_boss.active = true;
		other.btn_start_battle.active = true;
		other.btn_settings.active = true;
	});
	Anim_Create(window_settings,"scale_x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.95,0.06,10)
	Anim_Create(window_settings,"scale_y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.95,0.06,10)
	Anim_Create(window_settings,"scale_x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,1.01,-0.01,10,10)
	Anim_Create(window_settings,"scale_y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,1.01,-0.01,10,10)
	Anim_Create(window_settings,"active",0,0,0,1,0,20);
	Anim_Create(window_settings,"alpha",0,0,window_settings.alpha,1-window_settings.alpha,10);
	Anim_Create(window_settings,"black",0,0,0,0.5,10);
	closebtn = new UIButton(spr_ui_button_close,602,17);
	closebtn.AddEvent(UI_EVENT.CLICK,function(el){
		SFX_Play(snd_touch);
		var _window = el.parent;
		if(_window.closing) return;
		_window.active = false;
		el.active = false;
		Anim_Create(_window,"alpha",0,0,_window.alpha,-_window.alpha,10,0);
		Anim_Create(_window,"black",0,0,_window.black,-_window.black,10);
		Anim_Create(_window,"scale_x",0,0,1,-0.1,10);
		Anim_Create(_window,"scale_y",0,0,1,-0.1,10);
	});
	window_settings.AddContent(closebtn);
	window_settings_title = new UIText("{outline_color 0 65 140}{outline_thickness 2}"+Lang_GetString("ui.settings"),360,20);
	window_settings_title.halign = fa_center;
	window_settings_title.scale_x = 1.5;
	window_settings_title.scale_y = 1.5;
	window_settings_title.width = 10;
	window_settings.AddContent(window_settings_title);
	
	music_icon = new UIImage(spr_ui_icon_music,0,50,100);
	music_icon.color = make_color_rgb(48,159,236);
	music_icon.scale_x = 60/48;
	music_icon.scale_y = 60/48;
	music_switch = new UISwitch(spr_ui_switch,130,80);
	music_switch.AddEvent(UI_EVENT.CREATE,function(el){
		el.Set(Flag_Get(FLAG_SETTINGS,"music"));
	});
	music_switch.AddEvent(UI_EVENT.CHANGE,function(el){
		Flag_Set(FLAG_SETTINGS,"music",el.value);
		Flag_Save(FLAG_SETTINGS);
	});
	window_settings.AddContent(music_icon);
	window_settings.AddContent(music_switch);
	
	sound_icon = new UIImage(spr_ui_icon_sound,0,350,100);
	sound_icon.color = make_color_rgb(48,159,236);
	sound_icon.scale_x = 60/48;
	sound_icon.scale_y = 60/48;
	sound_switch = new UISwitch(spr_ui_switch,430,80);
	sound_switch.AddEvent(UI_EVENT.CREATE,function(el){
		el.Set(Flag_Get(FLAG_SETTINGS,"sound"));
	});
	sound_switch.AddEvent(UI_EVENT.CHANGE,function(el){
		Flag_Set(FLAG_SETTINGS,"sound",el.value);
		Flag_Save(FLAG_SETTINGS);
	});
	window_settings.AddContent(sound_icon);
	window_settings.AddContent(sound_switch);
	
	boss_hp_ratio_text = new UIText(Lang_GetString("ui.settings.boss.hp.ratio"),50,190);
	boss_hp_ratio_value = new UIText("",330,0);
	boss_hp_ratio = new UISlider(250,190,300,36,0.5,3);
	boss_hp_ratio.value_step = 0.1;
	boss_hp_ratio.display = boss_hp_ratio_value;
	boss_hp_ratio.AddEvent(UI_EVENT.CREATE,function(el){
		el.Set(Flag_Get(FLAG_SETTINGS,"boss_hp_ratio",1));
	});
	boss_hp_ratio.AddEvent(UI_EVENT.CHANGE,function(el){
		el.display.text = string(el.Get())+"x";
		Flag_Set(FLAG_SETTINGS,"boss_hp_ratio",el.value);
		Flag_Save(FLAG_SETTINGS);
	});
	boss_hp_ratio.AddContent(boss_hp_ratio_value);
	window_settings.AddContent(boss_hp_ratio_text);
	window_settings.AddContent(boss_hp_ratio);
	
	enemy_damage_ratio_text = new UIText(Lang_GetString("ui.settings.enemy.damage.ratio"),50,250);
	enemy_damage_ratio_value = new UIText("",330,0);
	enemy_damage_ratio = new UISlider(250,250,300,36,0.5,3);
	enemy_damage_ratio.value_step = 0.1;
	enemy_damage_ratio.display = enemy_damage_ratio_value;
	enemy_damage_ratio.AddEvent(UI_EVENT.CREATE,function(el){
		el.Set(Flag_Get(FLAG_SETTINGS,"enemy_damage_ratio",1));
	});
	enemy_damage_ratio.AddEvent(UI_EVENT.CHANGE,function(el){
		el.display.text = string(el.Get())+"x";
		Flag_Set(FLAG_SETTINGS,"enemy_damage_ratio",el.value);
		Flag_Save(FLAG_SETTINGS);
	});
	enemy_damage_ratio.AddContent(enemy_damage_ratio_value);
	window_settings.AddContent(enemy_damage_ratio_text);
	window_settings.AddContent(enemy_damage_ratio);
	
	swarm_text = new UIText(Lang_GetString("ui.settings.swarm"),50,330);
	swarm = new UISwitch(spr_ui_switch,130,300);
	swarm.AddEvent(UI_EVENT.CREATE,function(el){
		el.Set(Flag_Get(FLAG_SETTINGS,"swarm"));
	});
	swarm.AddEvent(UI_EVENT.CHANGE,function(el){
		Flag_Set(FLAG_SETTINGS,"swarm",el.value);
		Flag_Save(FLAG_SETTINGS);
	});
	window_settings.AddContent(swarm_text);
	window_settings.AddContent(swarm);
	
	other.main_ui.AddContent(window_settings);
})

main_window.AddContent(window_title)
main_window.AddContent([select_equipment_plane,select_equipment_armor,select_equipment_subweapon,select_equipment_wingman_left,select_equipment_wingman_right])
main_window.AddContent([btn_select_boss,btn_start_battle])
main_window.AddContent(btn_settings)
main_ui.AddContent(main_window)

refresh_preview()

time = 0