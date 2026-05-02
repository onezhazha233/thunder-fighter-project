live;
event_inherited();

if(rampage = false){
	for(i=0;i<array_length(laser);i+=1){
		if(instance_exists(laser[i])){
			if(laser[i].rampage = true&&laser[i].rampage_state = 0){
				laser[i].rampage_state = 1;
				Anim_Destroy(laser[i],"image_alpha");
				Anim_Destroy(laser[i],"image_xscale");
				Anim_Destroy(laser[i],"width");
				Anim_Destroy(laser[i],"image_index");
				laser[i].image_index = 1;
				Anim_Create(laser[i],"image_alpha",0,0,image_alpha,-image_alpha,5,5);
				Anim_Create(laser[i],"image_xscale",0,0,image_xscale,-image_xscale,10);
				Anim_Create(laser[i],"width",0,0,laser[i].width,-laser[i].width,10);
				Anim_Create(laser[i],"image_index",0,0,1,1,0,5);
				laser[i].duration = 10;
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
				laser[i].rampage_state = 1;
				Anim_Destroy(laser[i]);
				laser[i].image_index = 1;
				Anim_Create(laser[i],"image_alpha",0,0,image_alpha,-image_alpha,5,5);
				Anim_Create(laser[i],"image_xscale",0,0,image_xscale,-image_xscale,10);
				Anim_Create(laser[i],"width",0,0,laser[i].width,-laser[i].width,10);
				Anim_Create(laser[i],"image_index",0,0,1,1,0,5);
				laser[i].duration = 10;
			}
		}
	}
	for(i=0;i<array_length(ball);i+=1){
		if(instance_exists(ball[i])){
			instance_destroy(ball[i]);
		}
	}
}