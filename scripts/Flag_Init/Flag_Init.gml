function Flag_Init(){
	global.flag = {};
	Flag_Custom();
	global.save_slot = 0;
	
	#macro FLAG_SETTINGS "settings"
	var flag_settings = new Flag_Storage();
	Flag_RegisterType(FLAG_SETTINGS,flag_settings);
	Flag_CustomSettings();
	//将设置单独初始化防止被custom覆盖掉
	
	#macro GAME_SAVE_NAME "tfz_save"
}