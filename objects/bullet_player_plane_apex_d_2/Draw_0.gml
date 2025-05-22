event_inherited();

draw_sprite_ext(spr_bullet_player_apex_d_2,image_index,x-20*scale_x,y+14*scale_y,-1*scale_x,1*scale_y,image_angle-20,image_blend,image_alpha)
draw_sprite_ext(spr_bullet_player_apex_d_2,image_index,x+20*scale_x,y+14*scale_y,1*scale_x,1*scale_y,image_angle+20,image_blend,image_alpha)
draw_sprite_ext(sprite_index,image_index,x,y-21*scale_y,image_xscale*scale_x,image_yscale*scale_y,image_angle,image_blend,image_alpha)
draw_sprite_ext(spr_bullet_player_apex_d_1,image_index,x-39*scale_x,y+19*scale_y,-1.4*scale_x,image_yscale*scale_y,image_angle-13,image_blend,image_alpha)
draw_sprite_ext(spr_bullet_player_apex_d_1,image_index,x+39*scale_x,y+19*scale_y,1.4*scale_x,image_yscale*scale_y,image_angle+13,image_blend,image_alpha)