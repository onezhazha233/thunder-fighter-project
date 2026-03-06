live;
seq_array = [seq_sentinel_c_rampage_intro,seq_sentinel_c_rampage,seq_sentinel_c_rampage_outro,seq_sentinel_c_idle]
seq_index = 0
ll = layer_create(depth)
seq_instances = array_create(array_length(seq_array), noone);

for(i=0;i<array_length(seq_array);i+=1){
	seq_instances[i] = layer_sequence_create(ll,x,y,seq_array[i]);
	if(i > 0){
		layer_sequence_pause(seq_instances[i]);
		layer_sequence_xscale(seq_instances[i],0);
	}
}

seq = seq_instances[0];