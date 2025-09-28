live;
if(loop = 1){
	if(auto_destroy = true){
		alarm[0] = auto_destroy_delay;
	}
}
else{
	if(x > 360){
		x -= room_width + sprite_get_width(sprite_index);
		y += sprite_get_height(sprite_index)/2;
	}
	else{
		x += room_width + sprite_get_width(sprite_index);
		y += sprite_get_height(sprite_index)/2;
	}
}
loop = 1