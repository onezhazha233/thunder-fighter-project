live;
event_inherited();

warning = {
	obj : battle_warning_boss,
	lv : 10,
	name : "asd",
	
	Create : function(){
		ww = instance_create_depth(0,0,DEPTH_BATTLE.UI,obj);
		ww.lv = lv;
		ww.name = name;
		
		return ww;
	}
}

boss = {
	boss_list : [boss_galaxy_ash_p1,boss_galaxy_ash_p2],
	
	Create : function(){
		enemy = instance_create_depth(room_width/2,-200,0,boss_list[0]);
		array_delete(boss_list,0,1);
		enemy.boss_list = boss_list;
		
		return enemy;
	}
}

ds_queue_enqueue(enemies,[[warning],200])
ds_queue_enqueue(enemies,[[boss],200])