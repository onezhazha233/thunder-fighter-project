live;
draw_sprite_ext(spr_bullet_player_sniper_abcd_bg,0,x,y,image_xscale*scale_x,image_yscale*scale_y*1.5,image_angle,image_blend,image_alpha/2)
gpu_set_blendmode(bm_add)
draw_sprite_ext(spr_bullet_player_sniper_abcd_bg,0,x,y,image_xscale*scale_x,image_yscale*scale_y*1.5,image_angle,image_blend,image_alpha/2)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*scale_x,image_yscale*scale_y,image_angle,image_blend,image_alpha)
gpu_set_blendmode(bm_normal)