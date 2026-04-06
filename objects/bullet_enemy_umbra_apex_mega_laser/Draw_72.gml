live;
if(!surface_exists(surf))surf = surface_create(sprite_get_width(sprite_laser_start),1500)

surface_set_target(surf);
draw_clear_alpha(c_black,0);
surface_reset_target();