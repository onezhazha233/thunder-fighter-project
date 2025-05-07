live;
if!(point_in_rectangle(x,y,-30,-30,room_width+30,room_height+30)){
	instance_destroy();
}
else{
	alarm[1] = auto_destroy_delay;
}