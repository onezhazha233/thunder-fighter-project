live;
event_inherited();

time_interval_rampage = 45;

damages = [0,0,0,0,0.1082/3*2]

flame_list = [];
flame_interval = 8;
flame_timer = random(flame_interval);
flame_speed = 3;
flame_scale = 2;
flame_alpha = 1;

SetPosition = function(xx,yy){
	x = xx;
	y = yy;
	
	for(i=0;i<array_length(follow_inst);i+=1){
		if(instance_exists(follow_inst[i,0])){
			var item = follow_inst[i];
			var off = follow_inst[i,1];
			follow_inst[i,0].x = xx + lengthdir_x(off,image_angle+90);
			follow_inst[i,0].y = yy + lengthdir_y(off,image_angle+90);
			follow_inst[i,0].image_angle = image_angle + 90;
		}
		else{
			array_delete(follow_inst,i,1);
		}
	}
}
