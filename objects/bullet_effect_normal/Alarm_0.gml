live;
ll = layer_create(depth)
seq = layer_sequence_create(ll,x,y,sequence)
layer_sequence_xscale(seq,image_xscale)
layer_sequence_yscale(seq,image_yscale)
enabled = true