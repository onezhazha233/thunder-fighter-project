live;
event_inherited();

warning = {
	obj : battle_warning_boss,
	lv : 123,
	name : "暗黑突击",
	
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
	boss_list : [boss_dark_assault_p1],
	
	Create : function(){
		enemy = instance_create_depth(room_width/2,-200,DEPTH_BATTLE.ENEMIES,boss_list[0]);
		return enemy;
	}
}

ds_queue_enqueue(enemies,[[],60])
ds_queue_enqueue(enemies,[[warning],200])
ds_queue_enqueue(enemies,[[boss],200])