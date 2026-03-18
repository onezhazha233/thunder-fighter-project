live;
layer_sequence_destroy(bg_sequence)
layer_sequence_destroy(item_sequence)
if (layer_sequence_exists(ll_fx, effect_sequence)) layer_sequence_destroy(effect_sequence);
layer_destroy(ll)
layer_destroy(ll_fx)
