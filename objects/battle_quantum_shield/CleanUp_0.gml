live;
global.inv_shield = 0
with(bullet_enemy){
	destroy_type = 1;
	instance_destroy();
}
layer_destroy(sl)