live;
time += 1
if(time = 96){
	instance_create_depth(x,y,0,item);
}
if(time > 110)instance_destroy();