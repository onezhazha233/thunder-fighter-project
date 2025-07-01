live;
image_xscale = scale_x
image_yscale = scale_y

if(instance_exists(track_inst)&&acceleration < 0.9+rampage){
	dir = point_direction(x,y,track_inst.x,track_inst.y);
}

hspeed += lengthdir_x(acceleration,dir);
vspeed += lengthdir_y(acceleration,dir);

image_angle = direction - 90;

acceleration = min(acceleration+0.02*(rampage = false ? 1 : 2),0.9+rampage)

event_inherited();