live;
time += 1

if(bounce = 0){
	if(x < 0){
		x = 0;
		hspeed *= -1;
		image_angle *= -1;
		bounce = 1;
	}
	if(x > room_width){
		x = room_width;
		hspeed *= -1;
		image_angle *= -1;
		bounce = 1;
	}
}

image_xscale = scale_x*0.7
image_yscale = scale_y*(0.85+rampage*0.15)

if(rampage = false){
	image_alpha = 0.5;
	draw_self();
}
else{
	draw_self();
	draw_sprite_ext(sprite_index,image_index+1,x,y,image_xscale,image_yscale,image_angle,image_blend,cover_alpha*cover_alpha_factor);
}