live;
if(display_mode = 0){
	if(sprite_exists(enemy_sprite)){
		if(surf_enabled = 1)surface_set_target(surf);
		draw_sprite_ext(enemy_sprite,0,x-surf_x*surf_enabled,y-surf_y*surf_enabled,image_xscale,image_yscale,image_angle,image_blend,1);
		if(surf_enabled = 1)surface_reset_target();
	}
}

if(surf_enabled = true){
	gpu_set_blendmode_ext_sepalpha(bm_one, bm_inv_src_alpha, bm_one, bm_one);
	draw_surface(surf,surf_x,surf_y);
	gpu_set_blendmode(bm_normal);
}
if(hpbar_enabled = true&&hurt_time > 0){
	draw_sprite_ext(spr_ui_hpbar_enemy,0,x,y+hpbar_yoffset*image_yscale,image_xscale,image_yscale,0,-1,1);
	draw_sprite_part_ext(spr_ui_hpbar_enemy,1,0,0,sprite_get_width(spr_ui_hpbar_enemy)*hp/hp_max,sprite_get_height(spr_ui_hpbar_enemy),x-sprite_get_xoffset(spr_ui_hpbar_enemy),y-sprite_get_yoffset(spr_ui_hpbar_enemy)+hpbar_yoffset*image_yscale,image_xscale,image_yscale,-1,1);
}