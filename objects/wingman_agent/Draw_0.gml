if(idle_mode = 0){
	if(sprite_exists(idle_sprite)){
		if(draw_wingman = 1){
			if(surf_enabled = 1)surface_set_target(surf);
			draw_sprite_ext(idle_sprite,0,x-surf_x*surf_enabled,y-surf_y*surf_enabled,image_xscale*(flip=1 ? -1 : 1),image_yscale,image_angle,-1,1);
			if(surf_enabled = 1)surface_reset_target();
		}
	}
}

if(surf_enabled = 1){
	gpu_set_blendmode_ext_sepalpha(bm_one, bm_inv_src_alpha, bm_one, bm_one);
	draw_surface(surf,surf_x,surf_y);
	gpu_set_blendmode(bm_normal)
}