live;
if(display_mode = 0){
	if(sprite_exists(enemy_sprite)){
		if(surf_enabled = 1)surface_set_target(surf);
		draw_sprite_ext(enemy_sprite,0,x-surf_x*surf_enabled,y-surf_y*surf_enabled,image_xscale,image_yscale,image_angle,image_blend,1);
		
		gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
	    draw_surface_ext(surf_effect, 0, 0, 1, 1, 0, c_white, 1);
	    gpu_set_blendmode(bm_normal)
		
		if(surf_enabled = 1)surface_reset_target();
	}
}

if(surf_enabled = true){
	gpu_set_blendmode_ext_sepalpha(bm_one, bm_inv_src_alpha, bm_one, bm_one);
	draw_surface(surf,surf_x,surf_y);
	gpu_set_blendmode(bm_normal);
	
	surface_set_target(surf_effect);
    draw_clear_alpha(c_black,0);
    for(i=0;i<5;i+=1){
		for(j=0;j<5;j+=1){
			if(effect_type = 0){
				draw_sprite_ext(spr_effect_texture_ice,0,512*i,512*j,1,1,0,-1,effect_alpha);
			}
			if(effect_type = 1){
				for(k=0;k<512;k+=1){
					draw_sprite_part_ext(spr_effect_texture_fire,0,0,k,512,1,512*i+sin(k/30+time/20)*20,512*j+k,1,1,-1,effect_alpha);
				}
			}
		}
	}
    surface_reset_target();
}
if(hpbar_enabled = true&&hurt_time > 0){
	draw_sprite_ext(spr_ui_hpbar_enemy,0,x,y+hpbar_yoffset*image_yscale,image_xscale,image_yscale,0,-1,1);
	draw_sprite_part_ext(spr_ui_hpbar_enemy,1,0,0,sprite_get_width(spr_ui_hpbar_enemy)*hp/hp_max,sprite_get_height(spr_ui_hpbar_enemy),x-sprite_get_xoffset(spr_ui_hpbar_enemy),y-sprite_get_yoffset(spr_ui_hpbar_enemy)+hpbar_yoffset*image_yscale,image_xscale,image_yscale,-1,1);
}