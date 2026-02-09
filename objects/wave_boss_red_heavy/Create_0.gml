live;
event_inherited();

warning = {
	obj : battle_warning_boss,
	lv : 1225,
	name : "呼啸重装机",
	
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
	boss_list : [boss_red_heavy],
	
	Create : function(){
		enemy = instance_create_depth(room_width/2,-200,DEPTH_BATTLE.ENEMIES,boss_red_heavy);
		return enemy;
	}
}

ds_queue_enqueue(enemies,[[],60])
ds_queue_enqueue(enemies,[[warning],200])
ds_queue_enqueue(enemies,[[boss],200])