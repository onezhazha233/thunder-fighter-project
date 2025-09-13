live;
event_inherited();

scale_x = 1
scale_y = 1

time_interval_idle = [90+60,80+60,70+60,60+60]
time_interval_rampage = 1
attack_time = 0

rampage_time = 0

alarm[0] = 30

SetLevel = function(level){
	weapon_level = level;
	alarm[0] = 20;
	attack_time = 0;
}
SetRampage = function(rampage){
	self.rampage = rampage;
	if(rampage = true){
		alarm[0] = -1;
		alarm[1] = 1;
	}
	else{
		alarm[0] = 20;
		attack_time = 0;
		alarm[1] = -1;
	}
}