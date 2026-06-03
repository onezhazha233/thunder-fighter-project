live;
event_inherited();

warning = {
	obj : battle_warning_boss,
	lv : 31415926,
	name : Lang_GetString("boss.sirius_twins"),
	
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
		enemy[0] = instance_create_depth(room_width/2-100,-200,DEPTH_BATTLE.ENEMIES,boss_sirius_twins_0);
		enemy[1] = instance_create_depth(room_width/2+100,-200,DEPTH_BATTLE.ENEMIES,boss_sirius_twins_1);
		return enemy;
	}
}

ds_queue_enqueue(enemies,[[],60])
ds_queue_enqueue(enemies,[[warning],200])
ds_queue_enqueue(enemies,[[boss],200])