live;
if(display_mode = 0){
	if(sprite_exists(enemy_sprite)){
		if(surf_enabled = 1)surface_set_target(surf);
		draw_sprite_ext(enemy_sprite,0,x-surf_x*surf_enabled,y-surf_y*surf_enabled,image_xscale,image_yscale,image_angle,image_blend,1);
		
		gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_src_alpha);
	    draw_surface_ext(surf_effect,0,0,1,1,0,c_white,1);
	    gpu_set_blendmode(bm_normal);
		
		if(surf_enabled = true)surface_reset_target();
	}
}

// surface 显示、surf_effect 与 hpbar 已移到 layer_enemy_upper 的 layer_script_end（scrEndUpper），
// 保证在三个 layer（下层尾焰→本体→上层尾焰）都画完 surface 后再显示，避免修改 depth 后同深度绘制顺序不确定导致只显示尾焰