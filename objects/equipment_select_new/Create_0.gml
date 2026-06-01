live;
global.ui_showbox = 0
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

main_window.AddContent(window_title)
main_window.AddContent([select_equipment_plane,select_equipment_armor,select_equipment_subweapon,select_equipment_wingman_left,select_equipment_wingman_right])
main_window.AddContent([btn_select_boss,btn_start_battle])
main_ui.AddContent(main_window)

refresh_preview()

time = 0