live;
x += x_offset
y += y_offset

bullet = instance_place(x,y,bullet_enemy)
if(instance_exists(bullet)){
	with(bullet){
		destroy_type = other.type;
		instance_destroy();
	}
}