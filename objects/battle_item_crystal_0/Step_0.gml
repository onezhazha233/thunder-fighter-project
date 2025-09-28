live;
event_inherited();

if(Player_IsEnabled()){
	if(chase = 1){
		gravity = 0;
		direction = point_direction(x,y,player.x,player.y);
		speed = min(20,speed+4);
	}
}

vspeed = min(chase_speed_max,vspeed)

layer_sequence_x(item_sequence,x)
layer_sequence_y(item_sequence,y)