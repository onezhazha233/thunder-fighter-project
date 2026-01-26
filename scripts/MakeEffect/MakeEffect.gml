function MakeEffect(xx,yy,sequence,scale_x,scale_y,add=true){
	if(object_exists(sequence)){
		effect = instance_create_depth(xx,yy,DEPTH_BATTLE.INSTANCES_UPPER,sequence);
		effect.image_xscale = scale_x;
		effect.image_yscale = scale_y;
	}
	if(sequence_exists(sequence)){
		if(add = true){
			effect = layer_sequence_create(global.layer_effects,xx,yy,sequence);
			layer_sequence_xscale(effect,scale_x);
			layer_sequence_yscale(effect,scale_y);
		}
		else{
			effect = instance_create_depth(xx,yy,DEPTH_BATTLE.INSTANCES_UPPER,bullet_effect_normal);
			effect.sequence = sequence;
			effect.image_xscale = scale_x;
			effect.image_yscale = scale_y;
		}
	}
	
	return effect;
}