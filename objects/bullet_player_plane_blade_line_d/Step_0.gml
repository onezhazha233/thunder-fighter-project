live;
if(edge_cd >= 0){
	edge_cd -= 1;
}
if(edge_cd = 0){
	if!(instance_exists(edge_sequence)){
		if(edge_sequence_enabled = true){
			edge_sequence = instance_create_depth(edge_x,edge_y,0,bullet_player_plane_blade_edge);
			edge_sequence.edge_xscale = edge_xscale;
			edge_sequence.image_xscale = scale_x;
			edge_sequence.image_yscale = scale_y;
			edge_sequence.bullet_sequence = layer_sequence_create(edge_sequence.ll,edge_x,edge_y,seq_bullet_player_blade_d_edge);
			if!(array_contains(emitter_plane_blade_d.follow_inst,edge_sequence)){
				array_push(emitter_plane_blade_d.follow_inst,edge_sequence);
			}
		}
		edge_state = 1;
		Anim_Create(id,"edge_state",0,0,0,2,0,30);
	}
}
if(edge_attack_sequence_enabled = true){
	if(layer_sequence_is_finished(edge_attack_sequence)){
		layer_sequence_destroy(edge_attack_sequence);
	}
}