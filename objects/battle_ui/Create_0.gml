live;
depth = DEPTH_BATTLE.UI

hp_red_time = 0

boss_hpbar_enabled = false
boss_hpbar_phase = 0
boss_hpbar_lv = 0
boss_hpbar_name = "boss"
boss_hpbar_hp = 10
boss_hpbar_hp_max = 10

buff_list = ds_list_create()

main_ui = new UIBase(0,20,110,40)
main_ui.AddEvent(UI_EVENT.CLICK,function(){
	Game_Pause();
	SFX_Play(snd_touch);
})