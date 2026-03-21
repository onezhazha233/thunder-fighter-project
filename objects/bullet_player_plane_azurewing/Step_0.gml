live;
event_inherited();

delay -= 1
if(delay <= 0){
	animtime += animspd;
	image_xscale = scale*scale_x*(dir = 0 ? 1 : -1);
	image_yscale = scale*scale_y;
	image_angle = lerp(30,-40,animtime/13)*(dir = 0 ? 1 : -1);
	image_index = min(animtime,11);

	if(animtime > 13)instance_destroy();
}
else{
	image_xscale = 0;
}