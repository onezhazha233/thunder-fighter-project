live;
enabled = false
mark = noone
time = 0
duration = -1
loop = true

Clear = function(){
	with(bullet_enemy){
		if(mark = other.mark){
			destroy_type = 1;
			instance_destroy();
		}
	}
}