live;
event_inherited();

weapon_level = 0

time_interval_idle = [90,85,80,80]
time_interval_rampage = 1

rtime = 0

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	for(i=0;i<array_length(follow_inst);i+=1){
		if(instance_exists(follow_inst[i,0])){
			follow_inst[i,0].x = xx + follow_inst[i,1];
			follow_inst[i,0].y = yy + follow_inst[i,2];
		}
		else{
			array_delete(follow_inst,i,1);
		}
	}
}

damages = [0.0676,0.0961,0.1214,0.101,0.10977]