live;
event_inherited();

if(rampage = false){
	if(time mod 2 = 0){
		if(image_index = 0){
			image_index = 1;
		}
		else{
			image_index = 0;
		}
	}
}
else{
	if(time mod 2 = 0){
		image_index += 1;
	}
}

time += 1