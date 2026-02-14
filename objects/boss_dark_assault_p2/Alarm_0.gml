live;
SetSurfEnabled(surf_enabled)

SetState(0);

Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,x,x_target-x,move_start_duration);
Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,y_target-y,move_start_duration);
alarm[1] = move_start_duration + 15;

if!(bullet_emitter = noone){
	bullet_emitter_inst = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER,bullet_emitter);
	bullet_emitter_inst.mark = id;
}

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