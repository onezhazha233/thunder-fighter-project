live;
event_inherited();

layer_sequence_x(bg_sequence,x)
layer_sequence_y(bg_sequence,y)
layer_sequence_blend(bg_sequence,image_blend);
layer_sequence_alpha(bg_sequence,image_alpha);
layer_sequence_x(item_sequence,x)
layer_sequence_y(item_sequence,y)
layer_sequence_blend(item_sequence,image_blend);
layer_sequence_alpha(item_sequence,image_alpha);
if(layer_sequence_exists(ll_fx,effect_sequence)){
	layer_sequence_x(effect_sequence,x);
	layer_sequence_y(effect_sequence,y);
	layer_sequence_blend(effect_sequence,image_blend);
	layer_sequence_alpha(effect_sequence,image_alpha);
}