live;
if(player.visible = true){
	if(point_distance(x,y,player.x,player.y) <= detect_range){
		detect_amount = min(detect_target,detect_amount+1);
		if(detect_amount >= detect_target){
			chase = 1;
		}
	}
	if(chase = 1){
		direction = point_direction(x,y,player.x,player.y);
		speed = 15;
	}
	if(point_distance(x,y,player.x,player.y) <= speed){
		event_user(0);
		instance_destroy();
	}
}