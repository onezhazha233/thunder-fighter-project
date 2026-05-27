function Flag_Custom(){
	#macro FLAG_STATIC "static"
	var flag_static = new Flag_Storage();
	Flag_RegisterType(FLAG_STATIC,flag_static);
	Flag_CustomStatic();
	
	//#macro FLAG_SETTINGS "settings"
	//var flag_settings = new Flag_Storage();
	//Flag_RegisterType(FLAG_SETTINGS,flag_settings,false);
	//Flag_CustomSettings();
	//设置不进行初始化
}