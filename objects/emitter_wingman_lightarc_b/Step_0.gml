live;
event_inherited();

if(rampage = false){
	if(instance_exists(laser[2])){
		if(laser[2].duration <= -1){
			laser[2].duration = 10;
			Anim_Create(laser[2],"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1,-1,10);
		}
	}
	if(instance_exists(laser[3])){
		if(laser[3].duration <= -1){
			laser[3].duration = 10;
			Anim_Create(laser[3],"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1,-1,10);
		}
	}
	rampage_time = 0;
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