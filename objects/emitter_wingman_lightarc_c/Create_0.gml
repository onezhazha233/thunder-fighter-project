live;
event_inherited();

time_interval_idle = [60*2.5,60*2,60*1.5,60]
time_interval_rampage = 1

scale_x = 1
scale_y = 1

for(i=0;i<10;i+=1){
	laser[i] = noone;
	ball[i] = noone;
}

damage = 1

rampage_time = 0

angle_range = 20

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
		}
		else{
			array_delete(follow_inst,i,1);
		}
	}
}