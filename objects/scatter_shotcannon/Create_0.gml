sl = -1
sr = -1
draw = 1
ox = 132*2
oy = 29*2
f = layer_sequence_create("planes_lower",x+ox,y+oy,seq_shotcannon_abcd_flame_1);
layer_sequence_xscale(f,2);
layer_sequence_yscale(f,2);
f = layer_sequence_create("planes_lower",x-ox,y+oy,seq_shotcannon_abcd_flame_1);
layer_sequence_xscale(f,-2);
layer_sequence_yscale(f,2);