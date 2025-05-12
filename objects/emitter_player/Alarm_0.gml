if(enabled = true){
	if(rampage = false){
		alarm[0] = time_interval_idle[weapon_level];
		event_user(0);
	}
}
else{
	alarm[0] = 1;
}