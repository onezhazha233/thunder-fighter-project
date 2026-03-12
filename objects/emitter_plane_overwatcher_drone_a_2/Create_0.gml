live;
event_inherited();

time_interval_rampage = 45

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	for(i=0;i<array_length(follow_inst);i+=1){
		if(instance_exists(follow_inst[i,0])){
			follow_inst[i,0].x = xx + lengthdir_x(follow_inst[i,1],image_angle+90);
			follow_inst[i,0].y = yy + lengthdir_y(follow_inst[i,1],image_angle+90);
			follow_inst[i,0].image_angle = image_angle + 90;
		}
		else{
			array_delete(follow_inst,i,1);
		}
	}
}