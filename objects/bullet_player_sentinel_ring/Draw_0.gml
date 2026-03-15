live;
time += 1
if(time >= 18)instance_destroy();

image_xscale = scale
image_yscale = scale
image_blend = make_color_rgb(color[0],color[1],color[2])
gpu_set_blendmode(bm_add);
if(time <= 8){
	draw_self();
}
else{
	draw_sprite_ext(spr_bullet_player_sentinel_ring_light,0,x,y,light_scale,light_scale,0,make_color_rgb(light_r,light_g,light_b),light_alpha);
}
gpu_set_blendmode(bm_normal);