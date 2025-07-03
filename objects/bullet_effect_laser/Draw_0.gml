live;
gpu_set_blendmode(bm_add)
draw_sprite_ext(ring,image_index,x,y,image_xscale*scale_x,image_yscale*scale_y,image_angle,image_blend,image_alpha)
gpu_set_blendmode(bm_normal)
if(time < 4){
	draw_sprite_ext(lightball,0,x,y,image_xscale*scale_x*2,image_yscale*scale_y*2,0,-1,image_alpha);
}
if(time > 5&&time < 8){
	draw_sprite_ext(lightball,1,x,y,image_xscale*scale_x*2,image_yscale*scale_y*2,0,-1,image_alpha);
}
if(time > 5){
	for(i=0;i<ballnum;i+=1){
		draw_sprite_ext(lightball,ballimg[i],x+lengthdir_x(bl*balllen[i],balldir[i]),y+lengthdir_y(bl*balllen[i],balldir[i]),0.5*scale_x,0.5*scale_x,0,-1,image_alpha);
	}
}

time += 1