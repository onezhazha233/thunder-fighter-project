live;
event_inherited();

warning = {
	obj : battle_warning_boss,
	lv : spr_ui_warning_boss_lv_hellhound,
	name : Lang_GetString("boss.hellhound"),
	lv_spr_img: irandom(sprite_get_number(spr_ui_warning_boss_lv_hellhound)-1),
	
	Create : function(){
		ww = instance_create_depth(0,0,DEPTH_BATTLE.UI,obj);
		ww.lv = lv;
		ww.lv_spr_img = lv_spr_img;
		ww.name = name;
		battle_ui.boss_hpbar_lv = lv;
		battle_ui.boss_hpbar_lv_spr_enabled = true;
		battle_ui.boss_hpbar_lv_spr_img = lv_spr_img;
		battle_ui.boss_hpbar_name = name;
		
		return ww;
	}
}

boss = {
	boss_list : [boss_hellhound],
	
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