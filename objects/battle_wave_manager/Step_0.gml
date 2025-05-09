live;
if(enabled = true){
	if!(instance_exists(wave_inst)){
		if(ds_queue_size(waves) > 0){
			wave_inst = instance_create_depth(0,0,0,ds_queue_dequeue(waves));
			wave += 1;
		}
	}
}