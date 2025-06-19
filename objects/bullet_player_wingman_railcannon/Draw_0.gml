event_inherited();

if(time mod 2 = 0&&rampage = true){
	draw_sprite_ext(sprite_index,1,x,y,image_xscale*scale_x*1.83,image_yscale*scale_y,image_angle,image_blend,image_alpha*0.56)
}
time += 1
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*scale_x,image_yscale*scale_y,image_angle,image_blend,image_alpha)