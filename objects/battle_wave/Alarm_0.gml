live;
if(enabled = true){
	if!(ds_queue_empty(enemies)){
		enemies_info = ds_queue_dequeue(enemies);
	
		array_foreach(enemies_info[0],function(enemy){
			if(is_struct(enemy)){
				ee = enemy.Create();
			}
			else{
				ee = instance_create_depth(-1000,-1000,0,enemy);
			}
			ds_list_add(enemy_list,ee);
		});
	
		alarm[0] = max(1,enemies_info[1]);
	}
}
else{
	alarm[0] = 1;
}