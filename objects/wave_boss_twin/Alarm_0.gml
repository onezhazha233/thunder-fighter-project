live;
if(enabled = true){
	if!(ds_queue_empty(enemies)){
		enemies_info = ds_queue_dequeue(enemies);
	
		array_foreach(enemies_info[0],function(enemy){
			if(is_struct(enemy)){
				ee = enemy.Create();
				if(is_array(ee)){
					ds_list_add(enemy_list,ee[0]);
					ds_list_add(enemy_list,ee[1]);
				}
				else{
					ds_list_add(enemy_list,ee);
				}
			}
			else{
				ee = instance_create_depth(360,-1000,0,enemy);
				ds_list_add(enemy_list,ee);
			}
		});
	
		alarm[0] = max(1,enemies_info[1]);
	}
}
else{
	alarm[0] = 1;
}