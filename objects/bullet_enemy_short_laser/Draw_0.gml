live;
time += 1

ss = (time mod 6 < 3 ? 1.1 : 1)

image_xscale = length*scale_x
image_yscale = scale_y*ss*ss

event_inherited();

draw_sprite_ext(spr_bullet_enemy_short_laser_1,0,x+lengthdir_x(image_xscale,image_angle),y+lengthdir_y(image_xscale,image_angle),ss,ss,image_angle,-1,image_alpha)
draw_sprite_ext(spr_bullet_enemy_short_laser_1,0,x-lengthdir_x(image_xscale,image_angle),y-lengthdir_y(image_xscale,image_angle),ss,ss,image_angle,-1,image_alpha)