function GlobalInit(){
	global.hp_max = 10;
	global.hp = 10;
	global.atk_plane = 1;
	global.atk_wingman = 1;
	global.atk_subweapon = 1;
	global.inv_hurt = 0;
	global.inv_shield = 0;
	global.inv_cutscene = 0;
	global.rampage_duration = 300;
	global.quantum_shield_duration = 300;
	global.score = 0;
	randomize();
	
	global.debug_bullet_player_collision_display = false;
	global.debug_enemy_collision_display = false;
}