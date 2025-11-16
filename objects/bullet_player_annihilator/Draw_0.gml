live;
image_xscale = scale_x*0.7
image_yscale = scale_y*0.7

if(track_inst_exists = 1){
	if(!instance_exists(track_inst)&&turn_timer < 20){
		turn_timer = 0;
	}
}
if(instance_exists(track_inst)){
    target_x = track_inst.x;
    target_y = track_inst.y;
}

var tx = target_x;
var ty = target_y;

turn_timer -= 1

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
		speed *= 1.5;
		speed = min(speed, 60)
	}
	
	direction += delta * min(dirSpd + nearPerc, 1);
	
	dirSpd *= 1.2
	dirSpd = min(dirSpd, 1)
}
else{
	speed *= 1.5;
}

speed = min(speed, currentDis)

image_angle = direction - 90;

draw_sprite_ext(sprite_index,tail_image,x,y,image_xscale*scale_x,image_yscale*scale_y*tail_scale,image_angle,-1,1)
draw_self()

event_inherited();