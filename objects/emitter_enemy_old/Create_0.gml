live;
enabled = false
mark = noone
time = 0
duration = -1
loop = true

Clear = function(){
	with(bullet_enemy){
		if(mark = other.mark){
			destroy_type = 4;
			instance_destroy();
		}
	}
	with(enemy_blockbullet){
		if(mark = other.mark){
			if(inv_block = true){
				destroy_type = 4;
			}
			instance_destroy();
		}
	}
}