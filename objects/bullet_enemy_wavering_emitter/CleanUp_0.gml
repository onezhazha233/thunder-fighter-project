live;
switch(destroy_type){
	case 0:
	case 1:
	case 2:
	case 4:
		seq = layer_sequence_create(global.layer_effects,x,y,seq_bullet_effect_disappear);
		layer_sequence_xscale(seq,1);
		layer_sequence_yscale(seq,1);
		break;
}