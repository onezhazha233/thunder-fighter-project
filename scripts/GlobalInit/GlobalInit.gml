function GlobalInit(){
	global.player_move_speed = 12;
	global.hp_max = 10;
	global.hp = 10;
	global.atk_plane = 1;
	global.atk_wingman = 1;
	global.atk_subweapon = 1;
	global.atk_plane_bonus = [];
	global.atk_wingman_bonus = [];
	global.atk_subweapon_bonus = [];
	global.atk_all_bonus = [];
	global.inv_hurt = 0;
	global.inv_shield = 0;
	global.rampage_duration = 300;
	global.quantum_shield_duration = 300;
	global.inv_duration = 120;
	global.score = 0;
	global.breaktime = true;//为true时涉及倒计时的机制会暂停
	
	global.current_equipment = {
		plane: plane_assault_a,//asset_get_index(Flag_Get(FLAG_STATIC,"player_plane")),
		wingman_left: [],//[asset_get_index(Flag_Get(FLAG_STATIC,"player_wingman_left"))],
		wingman_right: [],//[asset_get_index(Flag_Get(FLAG_STATIC,"player_wingman_right"))],
		wingman_x_offset: [130,200],
		wingman_y_offset: [0,0],
		subweapon: emitter_player,//asset_get_index(Flag_Get(FLAG_STATIC,"player_subweapon")),
		armor: armor_lotus_a//asset_get_index(Flag_Get(FLAG_STATIC,"player_armor"))
	}
	global.choicebosswave = asset_get_index(Flag_Get(FLAG_STATIC,"current_boss_wave"));
	
	global.debug_bullet_player_collision_display = false;
	global.debug_bullet_enemy_collision_display = false;
	global.debug_enemy_collision_display = false;
	
	global.player_bullet_sfx = [
		snd_plane_shoot,
		snd_plane_blade_shoot_idle,
		snd_plane_blade_shoot_rampage,
		snd_plane_azurewing,
		snd_plane_glacier_laser_big,
		snd_plane_glacier_laser_small,
		snd_plane_falcon_idle,
		snd_plane_falcon_rampage,
		snd_wingman_sniper
	];
}
