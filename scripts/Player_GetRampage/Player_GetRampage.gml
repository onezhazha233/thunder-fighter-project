function Player_GetRampage(){
	if(instance_exists(player)&&instance_exists(player.equipment)){
		return player.rampage_duration;
	}
	else{
		return -1;
	}
}