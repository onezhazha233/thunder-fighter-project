live;
if!(point_in_rectangle(x,y,-200,-30,room_width+200,room_height+30)){
	instance_destroy();
}
else{
	alarm[0] = auto_destroy_delay;
}