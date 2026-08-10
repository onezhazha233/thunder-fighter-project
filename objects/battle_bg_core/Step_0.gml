live;
event_inherited();

if((instance_exists(battle_warning_boss)||instance_exists(boss_agent))&&bg_part_repeat[0] = true){
	for(var p=0;p<array_length(part_sprite);p+=1){
		bg_part_repeat[p] = false;
	}
}
if(!instance_exists(battle_warning_boss)&&!instance_exists(boss_agent)&&bg_part_repeat[0] = false){
	for(var p=0;p<array_length(part_sprite);p+=1){
		bg_part_repeat[p] = true;
	}
}