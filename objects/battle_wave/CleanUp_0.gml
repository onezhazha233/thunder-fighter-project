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
	global.inv_cutscene = 1;
	if (Player_IsEnabled()) {
		player.equipment.SetEnabled(false);
		Swarm_SetEnabled(false);
	}
} else {
	global.inv_cutscene = 0;
	if (Player_IsEnabled()) {
		player.equipment.SetEnabled(true);
		Swarm_SetEnabled(true);
	}
}
