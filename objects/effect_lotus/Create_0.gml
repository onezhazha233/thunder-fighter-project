live;
sequence = -1

ll = layer_create(DEPTH_BATTLE.ITEM_EFFECTS)
effect_seq = -1
enabled = false
mode = 0//0为充能 1为释放

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	if(layer_sequence_exists(ll,effect_seq)){
		layer_sequence_x(effect_seq,x);
		layer_sequence_y(effect_seq,y);
		layer_sequence_xscale(effect_seq,image_xscale);
		layer_sequence_yscale(effect_seq,image_yscale);
	}
}

SetSequence = function(index){
	SetPosition(player.x,player.y);
	switch(index){
		case 0:
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
			sequence = asset_get_index("seq_effect_armor_lotus_charge_"+string(index));
			mode = 0;
			break;
		case 6:
			sequence = seq_effect_armor_lotus_release;
			mode = 1;
			break;
	}
	effect_seq = layer_sequence_create(ll,x,y,sequence);
	enabled = true;
}