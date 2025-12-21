live;
depth = -600
sl = layer_create(depth)
effect_rampage = layer_sequence_create(sl,player.x,player.y,seq_battle_item_effect_rampage);

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	if(layer_sequence_exists(sl,effect_rampage)){
		layer_sequence_x(effect_rampage,x);
		layer_sequence_y(effect_rampage,y);
		layer_sequence_xscale(effect_rampage,image_xscale);
		layer_sequence_yscale(effect_rampage,image_yscale);
	}
}