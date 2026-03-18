live;
event_inherited();

layer_sequence_x(bg_sequence,x)
layer_sequence_y(bg_sequence,y)
layer_sequence_x(item_sequence,x)
layer_sequence_y(item_sequence,y)
if(layer_sequence_exists(ll_fx,effect_sequence)){
	layer_sequence_x(effect_sequence,x);
	layer_sequence_y(effect_sequence,y);
}
