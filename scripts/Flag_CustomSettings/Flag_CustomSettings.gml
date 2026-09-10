function Flag_CustomSettings(){
	with(Flag_GetStorage(FLAG_SETTINGS)){
		Set("language","chinese");//默认中文，可改为"english"
		Set("music",true);//是否开启音乐
		Set("sound",true);//是否开启音效
		Set("boss_hp_ratio",1);//boss血量倍率
		Set("enemy_damage_ratio",1);//敌人伤害倍率
		Set("swarm",true);//是否启用炮灰机
		Set("minion",true);//是否启用小敌机
	}
}