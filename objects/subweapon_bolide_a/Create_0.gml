live;
event_inherited();

time_interval_idle = [90,82,73,65]
time_interval_rampage = 27

damages = [1.4063,1.6656,1.2927,1.3542,0.8438*1.07]
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