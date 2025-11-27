live;
event_inherited();

time_interval_idle = [1,1,1,1]
time_interval_rampage = 1

for(i=0;i<10;i+=1){
	laser[i] = noone;
}

laser_scale = 1
laser_scale_target = 1
laser_scale_level = [1,1.19,1.39,1.59]

damages = [0.125,0.125*1.3,0.125*1.7,0.25,0.5]

SetRampage = function(rampage){
	self.rampage = rampage;
	if(rampage = true){
		alarm[0] = -1;
		alarm[1] = 1;
		laser_scale = laser_scale_level[weapon_level]/2;
	}
	else{
		alarm[0] = 1;
		alarm[1] = -1;
		laser_scale = 2;
	}
}