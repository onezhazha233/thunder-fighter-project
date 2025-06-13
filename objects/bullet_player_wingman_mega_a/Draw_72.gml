live;
if(!surface_exists(surf))surf = surface_create(sprite_get_width(start_sprite),1500);

surface_set_target(surf);
draw_clear_alpha(c_black,0);
surface_reset_target();