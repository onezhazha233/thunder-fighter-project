live;
if(edge_cd >= 0){
	edge_cd -= 1;
}
if(edge_cd = 0){
	if!(layer_sequence_exists("planes_upper",edge_sequence)){
		if(edge_sequence_enabled = true){
			edge_sequence = layer_sequence_create("planes_upper",x,y,seq_bullet_player_blade_a_edge);
		}
		edge_state = 1;
		Anim_Create(id,"edge_state",0,0,0,2,0,30);
	}
}
if(edge_sequence_enabled = true){
	if(layer_sequence_is_finished(edge_attack_sequence)){
		layer_sequence_destroy(edge_attack_sequence);
	}
}