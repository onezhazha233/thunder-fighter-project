if(layer_sequence_exists("bullets_player",bullet_sequence)){
	layer_sequence_destroy(bullet_sequence);
}

switch(destroy_type){
	case 0:
		
		break;
		
	case 1:
		
		break;
		
	case 2:
		if(hit_destroy = true){
			a = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,bullet_effect_enemy_hitplayer);
			a.image_xscale = scale_x;
			a.image_yscale = scale_y;
		}
		break;
}