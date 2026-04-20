live;
switch(destroy_type){
	case 0:
	case 1:
	case 4:
		seq = layer_sequence_create(global.layer_effects,x+lengthdir_x(25*image_xscale,image_angle),y+lengthdir_y(25*image_xscale,image_angle),seq_bullet_effect_disappear);
		layer_sequence_xscale(seq,1);
		layer_sequence_yscale(seq,1);
		break;
		
	case 2:
		if(collision_destroy = true){
			seq = layer_sequence_create(global.layer_effects,x+lengthdir_x(25*image_xscale,image_angle),y+lengthdir_y(25*image_xscale,image_angle),seq_bullet_effect_enemy_hitplayer);
			layer_sequence_xscale(seq,1);
			layer_sequence_yscale(seq,1);
			layer_sequence_angle(seq,random(360));
		}
		break;
}