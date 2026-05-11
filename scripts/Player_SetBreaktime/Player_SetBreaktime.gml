function Player_SetBreaktime(breaktime,override_fire=-1){
	global.breaktime = breaktime;
	if(Player_IsEnabled()){
		if(override_fire = -1){
			player.equipment.SetEnabled(!breaktime);
		}
		else{
			player.equipment.SetEnabled(override_fire);
		}
	}
}