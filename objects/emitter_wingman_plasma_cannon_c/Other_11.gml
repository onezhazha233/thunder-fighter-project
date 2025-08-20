live;
damage = 0.25*global.atk_wingman
for(i=0;i<1;i+=1){
	if!(instance_exists(laser[i])){
		laser[i] = instance_create_depth(x,y,depth,bullet_player_wingman_plasma_cannon_rampage);
		laser[i].image_xscale = scale_x;
		laser[i].image_xscale = scale_y;
		if(dir = 1)laser[i].image_xscale *= -1;
		with(laser[i]){
			bullet_sequence = layer_sequence_create(ll,x,y,seq_bullet_player_plasma_cannon_c_rampage);
			layer_sequence_xscale(bullet_sequence,image_xscale);
			layer_sequence_yscale(bullet_sequence,image_yscale);
		}
		laser[i].image_angle = 36*i;
		laser[i].damage = damage;
		array_push(follow_inst,laser[i]);
	}
}