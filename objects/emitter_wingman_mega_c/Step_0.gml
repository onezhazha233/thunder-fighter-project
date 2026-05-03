live;
event_inherited();

if(rampage = false){
	for(i=0;i<array_length(laser);i+=1){
		if(instance_exists(laser[i])){
			if(laser[i].rampage = true&&laser[i].rampage_state = 0){
				with(laser[i]){
					rampage_state = 1;
					Anim_Destroy(id);
					image_index = 1;
					Anim_Create(id,"image_alpha",0,0,image_alpha,-image_alpha,5,5);
					Anim_Create(id,"image_xscale",0,0,image_xscale,-image_xscale,10);
					Anim_Create(id,"width",0,0,width,-width,10);
					Anim_Create(id,"image_index",0,0,1,1,0,5);
					duration = 10;
				}
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
			if(laser[i].rampage = true&&laser[i].rampage_state = 0){
				with(laser[i]){
					rampage_state = 1;
					Anim_Destroy(id);
					image_index = 1;
					Anim_Create(id,"image_alpha",0,0,image_alpha,-image_alpha,5,5);
					Anim_Create(id,"image_xscale",0,0,image_xscale,-image_xscale,10);
					Anim_Create(id,"width",0,0,width,-width,10);
					Anim_Create(id,"image_index",0,0,1,1,0,5);
					duration = 10;
				}
			}
		}
	}
	for(i=0;i<array_length(ball);i+=1){
		if(instance_exists(ball[i])){
			instance_destroy(ball[i]);
		}
	}
}