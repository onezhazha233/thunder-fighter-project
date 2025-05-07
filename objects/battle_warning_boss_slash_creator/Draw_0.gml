live;
if!(surface_exists(surf))surf = surface_create(room_width,room_height);
with(battle_warning_boss_slash){
	surface_set_target(other.surf);
	draw_self();
	surface_reset_target();
}
draw_surface_part_ext(surf,room_width/2,0,room_width/2,room_height,room_width/2,0,1,1,-1,1)
draw_surface_part_ext(surf,room_width/2,0,room_width/2,room_height,room_width/2,0,-1,1,-1,1)