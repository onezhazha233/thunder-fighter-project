live;
if!(surface_exists(surf))surf = surface_create(room_width,room_height);

surface_set_target(surf);
draw_clear_alpha(0,0);
surface_reset_target();

with(battle_warning_boss_slash){
	surface_set_target(other.surf);
	gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
	draw_self();
	gpu_set_blendmode(bm_normal)
	surface_reset_target();
}

draw_surface_part_ext(surf,room_width/2,0,room_width/2,room_height,room_width/2,0,1,1,-1,image_alpha)
draw_surface_part_ext(surf,room_width/2,0,room_width/2,room_height,room_width/2,0,-1,1,-1,image_alpha)
gpu_set_blendmode(bm_add)
draw_surface_part_ext(surf,room_width/2,0,room_width/2,room_height,room_width/2,0,1,1,-1,image_alpha)
draw_surface_part_ext(surf,room_width/2,0,room_width/2,room_height,room_width/2,0,-1,1,-1,image_alpha)
gpu_set_blendmode(bm_normal)