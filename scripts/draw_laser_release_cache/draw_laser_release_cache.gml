function draw_laser_release_cache(){
	if (!variable_global_exists("draw_laser_surf")) return;
	if (surface_exists(global.draw_laser_surf)) {
		surface_free(global.draw_laser_surf);
	}
	global.draw_laser_surf = -1;
	global.draw_laser_surf_w = 0;
}
