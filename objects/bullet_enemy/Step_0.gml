image_angle += rotate

custom_function()

duration -= 1
if(duration = 0){
	destroy_type = 3;
	instance_destroy();
}

if(instance_exists(player)&&player.visible = true){
	if(global.inv_hurt = 0&&global.inv_shield = 0){
		if(collision_mask_enabled = true){
			if(place_meeting(x,y,player)){
				event_user(0);
				Player_CallHurtEvent();
				if(collision_destroy = true){
					instance_destroy();
				}
			}
		}
		else{
			switch(collision_mask_type){
				case 0:
					player_point = collision_rectangle(x-left*scale_x,y-up*scale_y,x+right*scale_x,y+down*scale_y,player,0,1);
					if!(player_point = noone){
						event_user(0);
						Player_CallHurtEvent();
						if(collision_destroy = true){
							instance_destroy();
						}
					}
					break;
				case 1:
					player_point = collision_ellipse(x-radius*scale_x,y-radius*scale_y,x+radius*scale_x,y+radius*scale_y,player,0,1);
					if!(player_point = noone){
						event_user(0);
						Player_CallHurtEvent();
						if(collision_destroy = true){
							instance_destroy();
						}
					}
					break;
			}
		}
	}
}

if(collision_mask_enabled = true){
	blk = instance_place(x,y,bullet_enemy_block);
	if(instance_exists(blk)){
		destroy_type = blk.type;
		instance_destroy();
	}
}
else{
	switch(collision_mask_type){
		case 0:
			blk = collision_rectangle(x-left*scale_x,y-up*scale_y,x+right*scale_x,y+down*scale_y,bullet_enemy_block,0,1);
			if(instance_exists(blk)){
				destroy_type = blk.type;
				instance_destroy();
			}
			break;
		case 1:
			blk = collision_ellipse(x-radius*scale_x,y-radius*scale_y,x+radius*scale_x,y+radius*scale_y,bullet_enemy_block,0,1);
			if(instance_exists(blk)){
				destroy_type = blk.type;
				instance_destroy();
			}
			break;
	}
}