live;
x += x_offset
y += y_offset

bullet = instance_place(x,y,bullet_enemy)
if(instance_exists(bullet)){
	with(bullet){
		if(inv_block = true){
			destroy_type = other.type;
			instance_destroy();
		}
	}
}