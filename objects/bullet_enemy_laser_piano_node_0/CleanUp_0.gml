live;
switch(destroy_type){
	case 0:
	case 1:
	case 2:
	case 4:
		a = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,effect_explosion_small);
		a.image_xscale = scale_x;
		a.image_yscale = scale_y;
		break;
}