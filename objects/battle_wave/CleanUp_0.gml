live;
ds_queue_destroy(enemies)
ds_list_destroy(enemy_list)

var is_last_wave = false;
if(instance_exists(battle_wave_manager)){
	var mgr = instance_find(battle_wave_manager, 0);
	if (mgr != noone) {
		if (ds_exists(mgr.waves, ds_type_queue)) {
			is_last_wave = (ds_queue_size(mgr.waves) <= 0);
		}
	}
}

if (is_last_wave) {
	Player_SetBreaktime(true);
	if (Player_IsEnabled()) {
		Swarm_SetEnabled(false);
	}
} else {
	Player_SetBreaktime(false);
	if (Player_IsEnabled()) {
		Swarm_SetEnabled(true);
	}
}
