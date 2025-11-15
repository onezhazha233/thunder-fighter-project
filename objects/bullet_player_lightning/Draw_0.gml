live;
image_xscale = scale_x
image_yscale = scale_y

/*if(instance_exists(track_inst)&&acceleration < 0.9+rampage){
	dir = point_direction(x,y,track_inst.x,track_inst.y);
}

hspeed += lengthdir_x(acceleration,dir);
vspeed += lengthdir_y(acceleration,dir);

acceleration = min(acceleration+0.2*(rampage = false ? 1 : 2),0.9+rampage)

image_angle = direction - 90;*/

var currentDis = 100
if(instance_exists(track_inst)){
	var targetDir = point_direction(x, y, track_inst.x, track_inst.y);
	var delta = angle_difference(targetDir, direction);
	var nearPerc = max(1 - (currentDis / bestDis), 0)
	
	
	if(abs(delta) > 90){
		speed *= 0.995;
		speed = max(speed, 0)
	}else{
		speed *= 1.05;
		speed = min(speed, 60)
	}
	
	direction += delta * min(dirSpd + nearPerc, 1);
	
	dirSpd *= 1.1
	dirSpd = min(dirSpd, 1)
}
else{
	speed *= 1.05;
}

speed = min(speed, currentDis)

image_angle = direction - 90;

event_inherited();