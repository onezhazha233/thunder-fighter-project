function Layer_Init(){
	global.layer_effects = layer_create(DEPTH_BATTLE.EFFECTS);
	global.layer_item_effects = layer_create(DEPTH_BATTLE.ITEM_EFFECTS);
	global.layer_bullets_enemy = layer_create(DEPTH_BATTLE.BULLETS_ENEMY);
	global.layer_items = layer_create(DEPTH_BATTLE.ITEMS);
	global.layer_items_crystal = layer_create(DEPTH_BATTLE.ITEMS_CRYSTAL);
	global.layer_bullets_player = layer_create(DEPTH_BATTLE.BULLETS_PLAYER);
	global.layer_instances_upper = layer_create(DEPTH_BATTLE.INSTANCES_UPPER);
	global.layer_enemies_die = layer_create(DEPTH_BATTLE.ENEMIES_DIE);
	
	var scrBegin = function () {
		if (event_number != ev_draw_normal) return;
		gpu_set_blendmode(bm_add);
	}

	var scrEnd = function () {
		if (event_number != ev_draw_normal) return;
		gpu_set_blendmode(bm_normal)
	}

	layer_script_begin(global.layer_effects, scrBegin);
	layer_script_end(global.layer_effects, scrEnd);
	//特效层始终发亮
}