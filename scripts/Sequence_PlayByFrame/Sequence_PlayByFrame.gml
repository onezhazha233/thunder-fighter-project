///@arg layer
function Sequence_PlayByFrame(layer_id){
	var elements = layer_get_all_elements(layer_id);
	var len = array_length(elements);
	if (len == 0) return;

	var target = game_get_speed(gamespeed_fps)/60;

	for (var i = 0; i < len; ++i){
		var el = elements[i];

		if (layer_get_element_type(el) != layerelementtype_sequence)
			continue;

		var sp = layer_sequence_get_speedscale(el);

		if (sp > 0 && sp != target)
			layer_sequence_speedscale(el, target);
	}
}