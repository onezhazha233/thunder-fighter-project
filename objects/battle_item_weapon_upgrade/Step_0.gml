live;
event_inherited();

if(x > room_width||x < 0){
	if(direction >= 0&&direction < 180){
		direction = 180 - direction;
	}
	else{
		direction = -180 - direction;
	}
}
if(y < 0||y > room_height){
	direction *= -1;
}

layer_sequence_x(bg_sequence,x)
layer_sequence_y(bg_sequence,y)
layer_sequence_x(item_sequence,x)
layer_sequence_y(item_sequence,y)