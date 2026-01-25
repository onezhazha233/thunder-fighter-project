if(layer_sequence_exists(global.layer_bullets_enemy,bullet_sequence)){
	layer_sequence_destroy(bullet_sequence);
}

switch(destroy_type){
	case 0:
		seq = layer_sequence_create(global.layer_effects,x,y,seq_bullet_effect_disappear);
		layer_sequence_xscale(seq,1);
		layer_sequence_yscale(seq,1);
		//a = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,bullet_effect_enemy_disappear);
		//a.image_xscale = scale_x;
		//a.image_yscale = scale_y;
		break;
		
	case 1:
		seq = layer_sequence_create(global.layer_effects,x,y,seq_bullet_effect_disappear);
		layer_sequence_xscale(seq,1);
		layer_sequence_yscale(seq,1);
		//a = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,bullet_effect_enemy_disappear);
		//a.image_xscale = scale_x;
		//a.image_yscale = scale_y;
		break;
		
	case 2:
		if(collision_destroy = true){
			seq = layer_sequence_create(global.layer_effects,x,y,seq_bullet_effect_enemy_hitplayer);
			layer_sequence_xscale(seq,1);
			layer_sequence_yscale(seq,1);
			layer_sequence_angle(seq,random(360));
			//a = instance_create_depth(x,y,DEPTH_BATTLE.INSTANCES_UPPER,bullet_effect_enemy_hitplayer);
			//a.image_xscale = scale_x;
			//a.image_yscale = scale_y;
		}
		break;
}