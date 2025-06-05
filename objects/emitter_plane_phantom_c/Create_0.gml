live;
event_inherited();

time_interval_idle = [1,1,1,1]
time_interval_rampage = 1

scale_x = 1
scale_y = 1

for(i=0;i<10;i+=1){
	laser[i] = noone;
}

laser_scale = 0.5
laser_scale_target = 0.5
laser_scale_level = [0.5,0.69,0.9,1]
laser_speed = [13,15,18,20]

SetRampage = function(rampage){
	for(i=0;i<1;i+=1){
		if(instance_exists(laser[i])){
			laser[i].laser_offset = 0;
		}
	}
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