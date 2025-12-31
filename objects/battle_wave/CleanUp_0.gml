live;
ds_queue_destroy(enemies)
ds_list_destroy(enemy_list)
global.inv_cutscene = 0;

if(Player_IsEnabled()){
	player.equipment.SetEnabled(true);
	Swarm_SetEnabled(true);
}