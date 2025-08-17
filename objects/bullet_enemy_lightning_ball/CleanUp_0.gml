live;
if(layer_sequence_exists("bullets_enemy",bullet_sequence)){
	layer_sequence_destroy(bullet_sequence);
}

switch(destroy_type){
	case 0:
	case 1:
	case 2:
		a = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,effect_explosion_medium);
		a.image_xscale = scale_x;
		a.image_yscale = scale_y;
		break;
}