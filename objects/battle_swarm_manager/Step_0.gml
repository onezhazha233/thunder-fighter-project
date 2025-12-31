live;
if(time >= interval){
	if(Swarm_IsEnabled()&&battle_wave_manager.enabled = true){
		for(i=0;i<array_length(swarm_list);i+=1){
			swarm_list[i].Create();
		}
	}
	
	time = 0;
}
if!(instance_exists(battle_warning_boss))time += 1