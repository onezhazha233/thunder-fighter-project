live;
global.inv_shield = 0
layer_destroy(sl)
layer_sequence_destroy(shield_sequence)
with(bullet_enemy){
	if(inv_block = false){
		destroy_type = 1;
		instance_destroy();
	}
}