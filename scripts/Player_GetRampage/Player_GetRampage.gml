function Player_GetRampage(){
	if(Player_IsEnabled()){
		return player.rampage_duration;
	}
	else{
		return -1;
	}
}