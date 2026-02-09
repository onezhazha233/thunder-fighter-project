live;
if(Player_IsEnabled()&&!instance_exists(battle_ui_victory)){
	if(point_distance(x,y,player.x,player.y) <= detect_range){
		detect_amount = min(detect_target,detect_amount+1);
		if(detect_amount >= detect_target){
			chase = 1;
		}
	}
	if(chase = 1){
		direction = point_direction(x,y,player.x,player.y);
		speed = min(chase_speed_max,speed+chase_acceleration);
	}
	if(point_distance(x,y,player.x,player.y) <= speed*2){
		event_user(0);
		instance_destroy();
	}
}