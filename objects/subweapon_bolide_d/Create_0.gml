live;
event_inherited();

time_interval_idle = [90,82,73,65]
time_interval_rampage = 27

damages = [1.4063,1.1104,0.9695*1.15,0.8125*1.12,0.6750*1.07]
type = 2

bb = 0

SetRampage = function(rampage){
	self.rampage = rampage;
	if(rampage = true){
		bb = 0;
		alarm[0] = -1;
		alarm[1] = 1;
	}
	else{
		alarm[0] = 1;
		alarm[1] = -1;
	}
}