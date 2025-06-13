live;
layer_sequence_xscale(bullet_sequence,image_xscale);
if(plane_agent.state = 0){
	if(plane_agent.roll_state < 0){
		ri = clamp(ceil(abs(plane_agent.roll_state))-1,0,2);
		layer_sequence_xscale(bullet_sequence,image_xscale*edge_xscale[ri]);
		layer_sequence_yscale(bullet_sequence,image_yscale);
	}
	else if(plane_agent.roll_state > 0){
		ri = clamp(ceil(abs(plane_agent.roll_state))-1,0,2);
		layer_sequence_xscale(bullet_sequence,image_xscale*edge_xscale[ri]);
		layer_sequence_yscale(bullet_sequence,image_yscale);
	}
}
if(layer_sequence_exists(ll,bullet_sequence)){
	layer_sequence_x(bullet_sequence,x);
	layer_sequence_y(bullet_sequence,y);
}