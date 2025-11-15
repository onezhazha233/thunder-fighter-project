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
if(track_inst != noone){
	var targetDir = point_direction(x, y, track_inst.x, track_inst.y);
	var delta = angle_difference(targetDir, dir);
	var nearPerc = max(1 - (currentDis / bestDis), 0)
	
	
	if(abs(delta) > 90){
		spd *= 0.995;
		spd = max(spd, 0)
	}else{
		spd *= 1.05;
		spd = min(spd, 60)
	}
	
	dir += delta * min(dirSpd + nearPerc, 1);
	
	dirSpd *= 1.1
	dirSpd = min(dirSpd, 1)
}
else{
	spd *= 1.01
}

x += lengthdir_x(min(spd, currentDis), dir);
y += lengthdir_y(min(spd, currentDis), dir);

image_angle = direction - 90;

event_inherited();