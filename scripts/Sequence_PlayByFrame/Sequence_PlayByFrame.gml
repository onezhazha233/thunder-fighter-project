///@arg layer
function Sequence_PlayByFrame(){
	var LAYER = argument[0];
	
	elements = layer_get_all_elements(LAYER);
	for(ly=0;ly<array_length(elements);ly+=1){
		if(layer_get_element_type(elements[ly]) = layerelementtype_sequence){
			if(layer_sequence_get_speedscale(elements[ly]) > 0){
				layer_sequence_speedscale(elements[ly],game_get_speed(gamespeed_fps)/60);
			}
		}
	}
}