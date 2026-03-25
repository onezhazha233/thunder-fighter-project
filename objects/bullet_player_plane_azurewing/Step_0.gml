live;
if(image_index < 4){
	event_inherited();
}
else{
	duration -= 1;
	if(duration = 0)instance_destroy();
}

if(duration < 16){
image_angle = angle*(dir == 0 ? 1 : -1);
image_xscale = scale*scale_x*(dir == 0 ? 1 : -1)
image_yscale = scale*scale_y
}
