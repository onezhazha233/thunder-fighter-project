live;
event_inherited();

if(rampage = false){
	for(i=0;i<10;i+=1){
		if(instance_exists(laser[i])){
			if(laser[i].object_index = bullet_player_wingman_plasma_cannon_rampage){
				instance_destroy(laser[i]);
			}
		}
	}
}
else{
	alarm[2] = -1;
}