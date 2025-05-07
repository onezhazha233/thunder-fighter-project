sl = -1
sr = -1
draw = 1
ox = 132*3
oy = 29*3
f = layer_sequence_create("planes_lower",x+ox,y+oy,seq_shotcannon_abcd_flame_0);
layer_sequence_xscale(f,3);
layer_sequence_yscale(f,3);
f = layer_sequence_create("planes_lower",x-ox,y+oy,seq_shotcannon_abcd_flame_0);
layer_sequence_xscale(f,-3);
layer_sequence_yscale(f,3);