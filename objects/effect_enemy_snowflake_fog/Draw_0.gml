live;
image_angle += rot
gpu_set_blendmode(bm_add)
draw_self()
gpu_set_blendmode(bm_normal)

duration -= 1
if(duration <= 0||!instance_exists(mark))instance_destroy();