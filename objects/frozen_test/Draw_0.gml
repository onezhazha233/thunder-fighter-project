live;
if(!surface_exists(surf)){
	surf = surface_create(surf_width,surf_height);
}
if(!surface_exists(surf_effect)){
	surf_effect = surface_create(surf_width,surf_height);
}
surface_set_target(surf);
draw_clear_alpha(c_black,0);
draw_sprite_ext(sprite_index,0,x-surf_x*surf_enabled,y-surf_y*surf_enabled,image_xscale,image_yscale,image_angle,image_blend,1);
surface_reset_target();
surface_set_target(surf_effect);
draw_clear_alpha(c_black,0);
if(frozen_duration > 0){
	for(var i = 0; i < 5; i += 1){
		for(var j = 0; j < 5; j += 1){
			draw_sprite_ext(spr_effect_texture_ice,0,512*i,512*j,1,1,0,-1,effect_alpha);
		}
	}
}
surface_reset_target();
draw_surface_ext(surf,0,0,1,1,0,c_white,1);
gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_src_alpha);
var _gpu_scissor = gpu_get_scissor();
gpu_set_scissor(bbox_left,bbox_top,bbox_right-bbox_left,bbox_bottom-bbox_top);
draw_surface_ext(surf_effect,0,0,1,1,0,c_white,1);
gpu_set_scissor(_gpu_scissor);
gpu_set_blendmode(bm_normal);
