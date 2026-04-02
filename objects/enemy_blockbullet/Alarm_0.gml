live;
if(collision_type = COLLISION_TYPE.RECTANGLE){
	collision_type = COLLISION_TYPE.SPRITE;
	mask_surf = surface_create(left+right,up+down);
	surface_set_target(mask_surf);
	draw_clear(c_white);
	surface_reset_target();
	mask_sprite = sprite_create_from_surface(mask_surf,0,0,left+right,up+down,0,0,left,up);
	mask_index = mask_sprite;
	surface_free(mask_surf);
}