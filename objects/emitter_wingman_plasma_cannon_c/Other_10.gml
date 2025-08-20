live;
damage = 18.75/2
switch(weapon_level){
	case 0:damage = 18.75/2*global.atk_wingman;break;
	case 1:damage = 19.5/2*global.atk_wingman;break;
	case 2:damage = 19.125/2*global.atk_wingman;break;
	case 3:damage = 15/2*global.atk_wingman;break;
}

for(i=0;i<1;i+=1){
	if!(instance_exists(laser[i])){
		laser[i] = instance_create_depth(x,y,depth,bullet_player_wingman_plasma_cannon);
		laser[i].image_xscale = scale_x;
		laser[i].image_xscale = scale_y;
		if(dir = 1)laser[i].image_xscale *= -1;
		with(laser[i]){
			bullet_sequence = layer_sequence_create(ll,x,y,seq_bullet_player_plasma_cannon_c);
			layer_sequence_xscale(bullet_sequence,image_xscale);
			layer_sequence_yscale(bullet_sequence,image_yscale);
		}
		laser[i].image_angle = 36*i;
		laser[i].damage = damage;
		array_push(follow_inst,laser[i]);
	}
}