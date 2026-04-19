live;
image_angle = 360/number
for(i=0;i<number;i+=1){
	blt[i] = instance_create_depth(x+lengthdir_x(size,image_angle*i),x+lengthdir_y(size,image_angle*i),0,battle_blt);
	blt[i].image_angle = image_angle*i + extra_angle;
}
enabled = 1;