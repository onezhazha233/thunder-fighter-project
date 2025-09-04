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