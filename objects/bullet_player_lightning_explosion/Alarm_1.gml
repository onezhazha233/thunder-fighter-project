live;
seq = layer_sequence_create(global.layer_effects,x,y,sequence)
layer_sequence_xscale(seq,image_xscale)
layer_sequence_yscale(seq,image_yscale)
layer_sequence_speedscale(seq,game_get_speed(gamespeed_fps)/60);