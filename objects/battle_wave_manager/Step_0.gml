live;
if(enabled = true){
	if(!instance_exists(wave_inst)&&(!array_contains(boss_waves,wave)||(array_contains(boss_waves,wave)&&!instance_exists(enemy_agent)))){
		if(ds_queue_size(waves) > 0){
			//if(Player_IsEnabled())player.equipment.SetEnabled(true);
			wave_inst = instance_create_depth(0,0,0,ds_queue_dequeue(waves));
			wave += 1;
		}
		else{
			enabled = false;
		}
	}
}