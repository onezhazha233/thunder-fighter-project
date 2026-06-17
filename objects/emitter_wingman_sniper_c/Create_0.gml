live;
event_inherited();

time_interval_idle = [75,75,70,65]
time_interval_rampage = 22

time = 0

damages = [1.875*10/13,2.4375*10/13,2.975*10/13,3.25*10/13,2.2*10/13]
type = 1

angle = 0
angles = [70,80,90,105]
angle_index = 0

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	for(i=0;i<array_length(follow_inst);i+=1){
		if(instance_exists(follow_inst[i,0])){
			follow_inst[i,0].x = xx + follow_inst[i,1]*scale_y;
			follow_inst[i,0].y = yy + follow_inst[i,2]*scale_y;
			
			with(follow_inst[i,0]){
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

SetRampage = function(rampage){
	self.rampage = rampage;
	if(rampage = true){
		alarm[0] = -1;
		alarm[1] = 1;
		alarm[2] = -1;
	}
	else{
		Anim_Destroy(id,"angle");
		angle = 0;
		angle_index += 1;
		alarm[0] = 60;
		alarm[1] = -1;
	}
}