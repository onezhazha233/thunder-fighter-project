live;
event_inherited();

for(i=0;i<3;i+=1){
	draw_sprite_ext(spr_pixel2x,0,x,y,line_length,2,i*120+30,c_red,0.5);
}

image_blend = make_color_rgb(255,bb,bb);

draw_self()