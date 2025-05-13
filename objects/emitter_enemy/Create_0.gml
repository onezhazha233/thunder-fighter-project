live;
enabled = false
mark = noone
time = 0

Clear = function(){
	with(bullet_enemy){
		if(mark = other.mark){
			destroy_type = 1;
			instance_destroy();
		}
	}
}