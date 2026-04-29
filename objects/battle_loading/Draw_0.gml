live;

if (preload_layer != noone) {
	for (var i = 0; i < array_length(preload_active); i++) {
		var _seq = preload_active[i];
		if (layer_sequence_exists(preload_layer, _seq)) {
			var _len = layer_sequence_get_length(_seq);
			layer_sequence_speedscale(_seq, max(1, _len / 30));
		}
	}
}

/*draw_text(100,100,preload_index)
draw_text(100,150,array_length(preload_list))
draw_text(100,200,array_length(preload_active))
draw_text(100,250,phase)
*/