live;
if(enabled = 1&&array_length(blt) > 0){
	rott += rot;
    for(i=0;i<number;i+=1){
		all_exist = false;
        if(instance_exists(blt[i])){
			blt[i].image_angle = rott + image_angle*i + extra_angle;
			blt[i].x = x + lengthdir_x(size,image_angle*i+rott);
			blt[i].y = y + lengthdir_y(size,image_angle*i+rott);
			all_exist = true;
        }
    }
}
duration -= 1
if(duration = 0||(enabled = true&&all_exist = false)){
	instance_destroy();
}