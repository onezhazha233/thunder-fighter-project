live;
event_inherited();

time_interval_idle = [1,1,1,1]
time_interval_rampage = 1

edge_cds = [45,27,15,11]
damages = [4.6875,4.6318,4.781,5.125,4.28]

laser_offset = 0

for(i=0;i<10;i+=1){
	laser[i] = noone;
}

SetRampage = function(rampage){
	if(self.rampage = false&&rampage = true){
		laser_offset = 0;
	}
	else{
		laser_offset = 78;
	}
	self.rampage = rampage;
	if(rampage = true){
		alarm[0] = -1;
		alarm[1] = 1;
		for(i=0;i<array_length(laser);i+=1){
			if(instance_exists(laser[i])){
				instance_destroy(laser[i]);
			}
		}
	}
	else{
		alarm[0] = 1;
		alarm[1] = -1;
		for(i=0;i<array_length(laser);i+=1){
			if(instance_exists(laser[i])){
				instance_destroy(laser[i]);
			}
		}
	}
}