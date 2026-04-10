live;
depth = DEPTH_BATTLE.UI

hp_red_time = 0

boss_hpbar_enabled = false
boss_hpbar_phase = 0
boss_hpbar_lv = 0
boss_hpbar_name = Lang_GetString("battle.testboss.name")
boss_hpbar_hp = 10
boss_hpbar_hp_max = 10

main_ui = new LuiMain();
main_ui.setStyle(new LuiStyle().setMinSize(32, 32)).centerContent();
pause_button = new LuiButton({width: 110,height: 40});
pause_button.setPositionAbsolute()
pause_button.setPosX(0)
pause_button.setPosY(20)
pause_button.addEvent(LUI_EV_CLICK, function(_element) {
    Game_Pause();
});
main_ui.addContent([pause_button]);