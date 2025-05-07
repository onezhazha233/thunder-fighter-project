rampage = false
weapon_level = 0
time_interval_idle = [8,8,8,8]
time_interval_rampage = 4
alarm[0] = 1

SetLevel = function(level){
	weapon_level = level;
	alarm[0] = 1;
}
SetRampage = function(rampage){
	self.rampage = rampage;
	if(rampage = true){
		alarm[0] = -1;
		alarm[1] = 1;
	}
	else{
		alarm[0] = 1;
		alarm[1] = -1;
	}
}