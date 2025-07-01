image_xscale = xscale*scale_x
image_yscale = yscale*scale_y

event_inherited();

gpu_set_blendmode(bm_add)
draw_self()
gpu_set_blendmode(bm_normal)