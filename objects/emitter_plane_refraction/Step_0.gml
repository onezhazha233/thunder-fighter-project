live;
event_inherited();

if(enabled = false){
	for(i=0;i<array_length(laser);i+=1){
		if(instance_exists(laser[i])){
			instance_destroy(laser[i]);
		}
	}
	follow_inst = [];
}

if(abs(laser_scale - laser_scale_target) > 0.01){
	laser_scale += (laser_scale_target - laser_scale)/5;
}
else{
	laser_scale = laser_scale_target;
}