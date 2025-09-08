live;
if(surf_enabled = 1){
	if(!surface_exists(surf))surf = surface_create(surf_width,surf_height);
	if(!surface_exists(surf_effect))surf_effect = surface_create(720,1280);

	surface_set_target(surf);
	draw_clear_alpha(c_black,0);
	surface_reset_target();
}