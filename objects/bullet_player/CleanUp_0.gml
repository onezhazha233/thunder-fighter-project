ds_map_destroy(collision_enemy)
if(layer_sequence_exists("bullets_player",bullet_sequence)){
	layer_sequence_destroy(bullet_sequence);
}
ds_list_destroy(enemy_list)