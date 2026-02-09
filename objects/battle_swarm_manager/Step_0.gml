live;
if(time >= interval){
	if(Swarm_IsEnabled()&&battle_wave_manager.enabled = true&&array_length(swarm_list) > 0){
		rdm = irandom(array_length(swarm_list)-1);
		for(i=0;i<array_length(swarm_list[rdm]);i+=1){
			swarm_list[rdm][i].Create();
		}
	}
	
	time = 0;
}
if!(instance_exists(battle_warning_boss))time += 1