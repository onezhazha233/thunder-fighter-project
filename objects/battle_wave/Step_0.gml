live;
if(enabled = true){
	if(ds_queue_empty(enemies)){
		for(i=0;i<ds_list_size(enemy_list);i+=1){
			if!(instance_exists(enemy_list[|i])){
				ds_list_delete(enemy_list,i);
			}
		}
	
		if(ds_list_empty(enemy_list)){
			instance_destroy();
		}
	}
}