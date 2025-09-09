function Layer_Init(){
	global.layer_effects = layer_create(DEPTH_BATTLE.EFFECTS);
	global.layer_item_effects = layer_create(DEPTH_BATTLE.ITEM_EFFECTS);
	global.layer_bullets_enemy = layer_create(DEPTH_BATTLE.BULLETS_ENEMY);
	global.layer_items = layer_create(DEPTH_BATTLE.ITEMS);
	global.layer_bullets_player = layer_create(DEPTH_BATTLE.BULLETS_PLAYER);
	global.layer_instances_upper = layer_create(DEPTH_BATTLE.INSTANCES_UPPER);
	global.layer_enemies_die = layer_create(DEPTH_BATTLE.ENEMIES_DIE);
}