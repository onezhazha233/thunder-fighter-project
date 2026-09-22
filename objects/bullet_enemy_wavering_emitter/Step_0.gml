live;
event_inherited();

if(Player_IsEnabled()&&image_alpha > 0.5){
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