live;
for(var i=0;i<array_length(bg_images);i+=1){
	bg_offset[i] += scroll_speed[i];

	if(bg_offset[i] >= bg_height[i]){
	    bg_offset[i] -= bg_height[i];
	}
	else if(bg_offset[i] < 0){
	    bg_offset[i] += bg_height[i];
	}
}