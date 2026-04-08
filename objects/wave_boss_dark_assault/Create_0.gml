live;
event_inherited();

warning = {
	obj : battle_warning_boss,
	lv : 114514,
	name : Lang_GetString("boss.dark_assault"),
	
	Create : function(){
		ww = instance_create_depth(0,0,DEPTH_BATTLE.UI,obj);
		ww.lv = lv;
		ww.name = name;
		battle_ui.boss_hpbar_lv = lv;
		battle_ui.boss_hpbar_name = name;
		
		return ww;
	}
}

boss = {
	boss_list : [boss_dark_assault_p1,boss_dark_assault_p2],
	
	Create : function(){
		enemy = instance_create_depth(room_width/2,-200,0,boss_list[0]);
		array_delete(boss_list,0,1);
		enemy.boss_list = boss_list;
		
		return enemy;
	}
}

ds_queue_enqueue(enemies,[[],60])
ds_queue_enqueue(enemies,[[warning],200])
ds_queue_enqueue(enemies,[[boss],200])