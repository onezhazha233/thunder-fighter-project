live;
if(idle_mode = 0){
	if(sprite_exists(idle_sprite)){
		if(draw_plane = 1){
			if(surf_enabled = 1)surface_set_target(surf);
			draw_sprite_ext(idle_sprite,0,x-surf_x*surf_enabled,y-surf_y*surf_enabled,(state == 0&&roll_state != 0 ? 0 : image_xscale),image_yscale,image_angle,image_blend,image_alpha);
			if(state = 0){
				if(roll_state < 0){
					draw_sprite_ext(sprite_roll_left,clamp(ceil(abs(roll_state))-1,0,2),x-surf_x*surf_enabled,y-surf_y*surf_enabled,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
				}
				else if(roll_state > 0){
					if(sprite_roll_flip = false){
						draw_sprite_ext(sprite_roll_right,clamp(ceil(roll_state)-1,0,2),x-surf_x*surf_enabled,y-surf_y*surf_enabled,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
					}
					else{
						draw_sprite_ext(sprite_roll_left,clamp(ceil(roll_state)-1,0,2),x-surf_x*surf_enabled,y-surf_y*surf_enabled,-image_xscale,image_yscale,image_angle,image_blend,image_alpha);
					}
				}
			}
			if(surf_enabled = 1)surface_reset_target();
		}
	}
}
else{
	if(state = 0){
		if(roll_state < 0){
			draw_sprite_ext(sprite_roll_left,clamp(ceil(abs(roll_state))-1,0,2),x-surf_x*surf_enabled,y-surf_y*surf_enabled,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		}
		else if(roll_state > 0){
			if(sprite_roll_flip = false){
				draw_sprite_ext(sprite_roll_right,clamp(ceil(roll_state)-1,0,2),x-surf_x*surf_enabled,y-surf_y*surf_enabled,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
			}
			else{
				draw_sprite_ext(sprite_roll_left,clamp(ceil(roll_state)-1,0,2),x-surf_x*surf_enabled,y-surf_y*surf_enabled,-image_xscale,image_yscale,image_angle,image_blend,image_alpha);
			}
		}
	}
}

if(surf_enabled = 1){
	gpu_set_blendmode_ext_sepalpha(bm_one, bm_inv_src_alpha, bm_one, bm_one);
	draw_surface(surf,surf_x,surf_y);
	gpu_set_blendmode(bm_normal)
}