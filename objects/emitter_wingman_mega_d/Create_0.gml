live;
event_inherited();

time_interval_idle = [60*2.5,60*2,60*1.5,60]
time_interval_rampage = 1

for(i=0;i<10;i+=1){
	laser[i] = noone;
	ball[i] = noone;
}

damages = [9.375/21,9.75/21,9.5625/21,7.5/21,0.25]
type = 1

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	for(i=0;i<array_length(follow_inst);i+=1){
		if(instance_exists(follow_inst[i,0])){
			follow_inst[i,0].x = xx;
			follow_inst[i,0].y = yy + follow_inst[i,1]*scale_y;
			
			with(follow_inst[i,0]){
			if(variable_instance_exists(id,"bullet_sequence")){
				if(variable_instance_exists(id,"ll")){
					if(layer_sequence_exists(ll,bullet_sequence)){
						layer_sequence_x(bullet_sequence,x);
						layer_sequence_y(bullet_sequence,y);
					}
				}
			}
		}
		}
		else{
			array_delete(follow_inst,i,1);
		}
	}
}

SetRampage = function(rampage){
	self.rampage = rampage;
	if(rampage = true){
		alarm[0] = -1;
		alarm[1] = 1;
	}
	else{
		alarm[0] = 20;
		alarm[1] = -1;
	}
}