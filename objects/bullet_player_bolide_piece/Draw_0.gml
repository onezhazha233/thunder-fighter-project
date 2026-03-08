live;
event_inherited();

image_xscale = scale_x
image_yscale = scale_y

if(abs(tail_distance-tail_distance_target) < 1){
	tail_distance = tail_distance_target;
}
else{
	tail_distance += (tail_distance_target - tail_distance)/1.5;
}

draw_sprite_ext(tail_sprite,0,x-lengthdir_x(tail_distance,image_angle)*scale_x/2,y-lengthdir_y(tail_distance,image_angle)*scale_y/2,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
draw_sprite_ext(sprite_index,0,x+lengthdir_x(tail_distance,image_angle)*scale_x/2,y+lengthdir_y(tail_distance,image_angle)*scale_y/2,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
//gpu_set_blendmode(bm_add)
//draw_sprite_ext(tail_sprite,0,x-lengthdir_x(tail_distance,image_angle)*scale_x/2,y-lengthdir_y(tail_distance,image_angle)*scale_y/2,image_xscale,image_yscale,image_angle,image_blend,image_alpha/2)
//draw_sprite_ext(sprite_index,0,x+lengthdir_x(tail_distance,image_angle)*scale_x/2,y+lengthdir_y(tail_distance,image_angle)*scale_y/2,image_xscale,image_yscale,image_angle,image_blend,image_alpha/2)
//gpu_set_blendmode(bm_normal)