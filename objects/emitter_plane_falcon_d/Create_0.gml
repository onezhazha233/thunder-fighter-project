live;
event_inherited();

time_interval_idle = [1,1,1,1]
time_interval_rampage = 1

for(i=0;i<10;i+=1){
	laser[i] = noone;
}

laser_scale = 1
laser_scale_target = 1
laser_scale_level = [1.25,1.27,1.30,1.33]

damages = [0.047,0.061,0.08,0.094,0.188]

ring_time = 0

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
SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	for(i=0;i<array_length(follow_inst);i+=1){
		if(instance_exists(follow_inst[i])){
			follow_inst[i].x = xx;
			follow_inst[i].y = yy;
			
			with(follow_inst[i]){
				if(variable_instance_exists(id,"bullet_sequence")){
					if(variable_instance_exists(id,"ll")){
						layer_sequence_x(bullet_sequence,x);
						layer_sequence_y(bullet_sequence,y);
					}
				}
			}
			with(follow_inst[i]){
				if(variable_instance_exists(id,"seq")){
					if(variable_instance_exists(id,"ll")){
						layer_sequence_x(seq,x);
						layer_sequence_y(seq,y);
					}
				}
			}
		}
		else{
			array_delete(follow_inst,i,1);
		}
	}
}