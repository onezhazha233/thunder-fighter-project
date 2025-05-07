s = layer_sequence_create("planes",x,y,seq_dawn_c_idle);
layer_sequence_xscale(s,3);
layer_sequence_yscale(s,3);
f0 = layer_sequence_create("planes_lower",x,y,seq_dawn_c_flame_0);
layer_sequence_xscale(f0,3);
layer_sequence_yscale(f0,3);
f1 = layer_sequence_create("planes_upper",x,y,seq_dawn_c_flame_1);
layer_sequence_xscale(f1,3);
layer_sequence_yscale(f1,3);