live;
event_inherited();

draw_sprite_ext(sprite_index,0,x,y,0.95,0.95*yscale,image_angle,image_blend,image_alpha)
draw_sprite_ext(sprite_index,0,x-31,y-36+(1-yscale)*30,0.51,1*yscale,image_angle,image_blend,image_alpha)
draw_sprite_ext(sprite_index,0,x-52,y-48+(1-yscale)*20,0.51,1*yscale,image_angle,image_blend,image_alpha)
draw_sprite_ext(sprite_index,0,x+31,y-36+(1-yscale)*30,0.51,1*yscale,image_angle,image_blend,image_alpha)
draw_sprite_ext(sprite_index,0,x+52,y-48+(1-yscale)*20,0.51,1*yscale,image_angle,image_blend,image_alpha)