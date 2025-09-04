live;
event_inherited();

if(rampage = false){
	for(i=0;i<10;i+=1){
		if(instance_exists(laser[i])){
			if(laser[i].object_index = bullet_player_wingman_mega_d_rampage){
				instance_destroy(laser[i]);
			}
		}
	}
}
else{
	alarm[2] = -1;
}

if(enabled = false){
	for(i=0;i<array_length(laser);i+=1){
		if(instance_exists(laser[i])){
			instance_destroy(laser[i]);
		}
	}
	for(i=0;i<array_length(ball);i+=1){
		if(instance_exists(ball[i])){
			instance_destroy(ball[i]);
		}
	}
}