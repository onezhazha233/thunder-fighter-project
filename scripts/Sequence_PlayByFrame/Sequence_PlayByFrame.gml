///@arg layer
function Sequence_PlayByFrame(){
	var LAYER = argument[0];
	
	elements = layer_get_all_elements(LAYER);
	for(i=0;i<array_length(elements);i+=1){
		if(layer_get_element_type(elements[i]) = layerelementtype_sequence){
			if(layer_sequence_get_speedscale(elements[i]) > 0){
				layer_sequence_speedscale(elements[i],game_get_speed(gamespeed_fps)/60);
			}
		}
	}
}