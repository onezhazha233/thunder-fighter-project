ds_map_destroy(collision_enemy)
if(layer_sequence_exists("bullets_player",bullet_sequence)){
	layer_sequence_destroy(bullet_sequence);
}
if!(destroy_effect = noone){
	a = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,destroy_effect);
	a.image_xscale = scale_x;
	a.image_yscale = scale_y;
}