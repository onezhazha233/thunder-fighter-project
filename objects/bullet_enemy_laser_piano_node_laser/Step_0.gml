live;
duration -= 1
if(duration = 0){
	enabled = false;
}
if(enabled = true){
	if(abs(image_yscale) < 1){
		image_yscale += (1-image_yscale)/4;
	}
	else{
		image_yscale = 1;
	}
}
else{
	image_yscale -= image_yscale/5;
	if(abs(image_yscale) < 0.1)instance_destroy();
}

if(Player_IsEnabled()){
	if(global.inv_hurt = 0&&global.inv_shield = 0&&!Player_IsBreaktime()){
		if(collision_mask_enabled = true){
			if(place_meeting(x,y,player)){
				event_user(0);
				Player_CallHurtEvent();
				if(collision_destroy = true){
					instance_destroy();
				}
			}
		}
	}
}