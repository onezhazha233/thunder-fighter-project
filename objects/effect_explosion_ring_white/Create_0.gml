live;
depth = DEPTH_BATTLE.EXPLOSION
image_speed = 0
image_index = 0
image_alpha = 0.8
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_xscale,12,20)
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_yscale,12,20)
Anim_Create(id,"image_alpha",0,0,image_alpha,-image_alpha,20)

alarm[0] = 20