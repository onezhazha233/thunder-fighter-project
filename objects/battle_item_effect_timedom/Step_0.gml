live;
time += 1
rand_angle_offset[0] += 0.86;
if(time = 96){
	a = instance_create_depth(x,y,0,item);
	if(item_duration > 0)a.SetDuration(item_duration);
	a.direction = 90 + random_range(-30,30);
	a.speed = random_range(2,6);
}
if(time > 110)instance_destroy();