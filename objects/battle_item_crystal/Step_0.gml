live;
if(Player_IsEnabled()){
	if(point_distance(x,y,player.x,player.y) <= detect_range){
		detect_amount = min(detect_target,detect_amount+1);
		if(detect_amount >= detect_target){
			chase = 1;
			if(Anim_IsExists(id,"x"))Anim_Destroy(id,"x");
			if(Anim_IsExists(id,"y"))Anim_Destroy(id,"y");
			gravity = 0;
		}
	}
	if(chase = 1){
		direction = point_direction(x,y,player.x,player.y);
		speed = min(chase_speed_max,speed+chase_acceleration);
	}
	if(point_distance(x,y,player.x,player.y) <= 10){
		event_user(0);
		instance_destroy();
	}
}