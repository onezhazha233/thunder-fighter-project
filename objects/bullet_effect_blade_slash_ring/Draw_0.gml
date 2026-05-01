live;
gpu_set_blendmode(bm_add)
draw_sprite_ext(sprite_index,0,x,y,image_xscale/2*scale_x,image_yscale/2*scale_y,0,-1,image_alpha-0.5)
draw_self()
gpu_set_blendmode(bm_normal)