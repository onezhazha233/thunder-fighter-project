live;
gpu_set_blendmode(bm_add)
draw_self()
draw_set_alpha(image_alpha)
draw_circle_color(x,y,lerp(150,200,1-(12-image_xscale)/12),c_white,c_black,0)
draw_set_alpha(1)
gpu_set_blendmode(bm_normal)