event_inherited();

gpu_set_blendmode(bm_add)
var _ox = lengthdir_x(20*scale_x, image_angle);
var _oy = lengthdir_y(20*scale_x, image_angle);
draw_sprite_ext(sprite_index,image_index,x+_ox,y+_oy,image_xscale*scale_x,image_yscale*scale_y,image_angle,image_blend,image_alpha)
draw_sprite_ext(sprite_index,image_index,x-_ox,y-_oy,-image_xscale*scale_x,image_yscale*scale_y,image_angle,image_blend,image_alpha)
gpu_set_blendmode(bm_normal)
