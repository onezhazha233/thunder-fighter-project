live;
x += x_offset
y += y_offset

bullet = instance_place(x,y,bullet_enemy)
if(instance_exists(bullet)){
	with(bullet){
		destroy_type = 0;
		instance_destroy();
	}
}
with(bullet_enemy){
	if(collision_mask_type = 1){
		if(collision_circle(x,y,radius,other,true,true)){
			destroy_type = 1;
			instance_destroy();
		}
	}
}

//draw_self()