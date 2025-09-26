enabled = true
rampage = false
weapon_level = 0
time_interval_idle = [8,8,8,8]
time_interval_rampage = 4
dir = 0//0为右 1为左
alarm[0] = 1
follow_inst = []
scale_x = 1
scale_y = 1

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	for(i=0;i<array_length(follow_inst);i+=1){
		if(instance_exists(follow_inst[i])){
			follow_inst[i].x = xx;
			follow_inst[i].y = yy;
		}
		else{
			array_delete(follow_inst,i,1);
		}
	}
}
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