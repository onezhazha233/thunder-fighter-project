live;
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index, floor(image_index), x+ offset_x*scale_x, y+ offset_y*scale_y, image_xscale*scale_x, image_yscale*scale_y, image_angle, c_white, image_alpha);
gpu_set_blendmode(bm_normal);