function GlobalInit(){
	global.player_move_speed = 12;
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
	global.inv_duration = 120;
	global.score = 0;
	
	global.current_equipment = {
		plane: plane_assault_a,
		wingman_left: [wingman_shotcannon_a],
		wingman_right: [wingman_shotcannon_a],
		wingman_x_offset: [130],
		wingman_y_offset: [0],
		subweapon: subweapon_missile_a,
		armor: armor_alloy_a
	}
	
	global.debug_bullet_player_collision_display = false;
	global.debug_bullet_enemy_collision_display = false;
	global.debug_enemy_collision_display = false;
}