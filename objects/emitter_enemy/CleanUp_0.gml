live;
if(player.equipment.state = 1){
	with(bullet_enemy){
		if(mark = other.mark){
			destroy_type = 1;
			instance_destroy();
		}
	}
}