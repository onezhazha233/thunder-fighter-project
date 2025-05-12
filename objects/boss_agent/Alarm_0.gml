live;
SetSurfEnabled(surf_enabled)

SetState(0);

if(skip = true){
	Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,x,x_target-x,30);
	Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,y_target-y,30);
	alarm[1] = 45;
}
if!(bullet_emitter = noone){
	bullet_emitter_inst = instance_create_depth(x,y,DEPTH_BATTLE.BULLETS_PLAYER,bullet_emitter);
	bullet_emitter_inst.mark = id;
}