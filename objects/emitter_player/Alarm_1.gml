if(enabled = true){
	if(rampage = true){
		alarm[1] = time_interval_rampage;
		event_user(1);
	}
}
else{
	alarm[1] = 1;
}