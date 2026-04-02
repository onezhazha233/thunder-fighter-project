live;
SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	if(layer_sequence_exists(layer_enemy,enemy_sequence)){
		layer_sequence_x(enemy_sequence,x-surf_x*surf_enabled);
		layer_sequence_y(enemy_sequence,y-surf_y*surf_enabled);
		layer_sequence_xscale(enemy_sequence,image_xscale);
		layer_sequence_yscale(enemy_sequence,image_yscale);
		layer_sequence_angle(enemy_sequence,image_angle);
	}
}

Hurt = function(){}

SetSequence = function(seq,spd=1,pos=0,dir=seqdir_right){
	if(hp > 0){
		layer_sequence_destroy(enemy_sequence);
		enemy_sequence = layer_sequence_create(layer_enemy,x,y,seq);
		layer_sequence_xscale(enemy_sequence,image_xscale);
		layer_sequence_yscale(enemy_sequence,image_yscale);
		layer_sequence_speedscale(enemy_sequence,spd);
		if(pos = 0)p = 0;
		if(pos = 1)p = layer_sequence_get_length(enemy_sequence);
		layer_sequence_headpos(enemy_sequence,p);
		layer_sequence_headdir(enemy_sequence,dir);
	}
}