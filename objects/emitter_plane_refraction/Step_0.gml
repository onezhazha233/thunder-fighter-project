live;
event_inherited();

if(enabled = false){
	for(i=0;i<array_length(follow_inst);i+=1){
		if(instance_exists(follow_inst[i,0])){
			instance_destroy(follow_inst[i,0]);
		}
	}
}

if(abs(laser_scale - laser_scale_target) > 0.01){
	laser_scale += (laser_scale_target - laser_scale)/5;
}
else{
	laser_scale = laser_scale_target;
}