live;
event_inherited();

weapon_level = 0

time_interval_idle = [80,80,80,80]
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

damages = [0.0746,0.1274,0.0966,0.1352,0.11327]