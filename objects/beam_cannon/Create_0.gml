ox = 132*3
oy = 29*3
sl = layer_sequence_create("planes",x-ox,y+oy,seq_mega_a_idle);
layer_sequence_xscale(sl,-3);
layer_sequence_yscale(sl,3);
sr = layer_sequence_create("planes",x+ox,y+oy,seq_mega_a_idle);
layer_sequence_xscale(sr,3);
layer_sequence_yscale(sr,3);