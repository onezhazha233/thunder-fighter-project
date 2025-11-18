live;
image_xscale = scale_x*0.7
image_yscale = scale_y*0.7

if(track_inst_exists = 1){
	if(!instance_exists(track_inst)){
		target_x = target_x_previous;
		target_y = target_y_previous;
	}
}

if(instance_exists(track_inst)){
	target_x_previous = target_x;
	target_y_previous = target_y;

    target_x = track_inst.x;
    target_y = track_inst.y;
}

var tx = target_x;
var ty = target_y;

var currentDis = 100
if(instance_exists(track_inst)){
	var targetDir = point_direction(x, y, tx, ty);
	var delta = angle_difference(targetDir, direction);
	var nearPerc = max(1 - (currentDis / bestDis), 0)
	
	
	if(abs(delta) > 45){
		speed *= 0.98;
		speed = max(speed, 0)
	}else if(abs(delta) > 45){
		
	}else{
		speed *= 1.5+rampage*0.1;
		speed = min(speed, 60)
	}
	
	direction += delta * min(dirSpd + nearPerc, 1);
	
	dirSpd *= 1.2
	dirSpd = min(dirSpd, 1)
}
else{
	if(point_distance(x,y,tx,ty) < 50)pass_target = 1;
	
	if(pass_target = 0){
		var targetDir = point_direction(x, y, target_x, target_y);
		var delta = angle_difference(targetDir, direction);
		var nearPerc = max(1 - (currentDis / bestDis), 0)
	
	
		if(abs(delta) > 45){
			speed *= 0.98;
			speed = max(speed, 0)
		}else if(abs(delta) > 45){
		
		}else{
			speed *= 1.2+rampage*0.1;
			speed = min(speed, 60)
		}
	
		direction += delta * min(dirSpd + nearPerc, 1);
	
		dirSpd *= 1.2
		dirSpd = min(dirSpd, 1)
	}
	else{
		speed *= 1.2;
	}
}

speed = min(speed, currentDis)

image_angle = direction - 90;

draw_sprite_ext(sprite_index,tail_image,x,y,image_xscale*scale_x,image_yscale*scale_y*tail_scale,image_angle,-1,1)
draw_self()

event_inherited();