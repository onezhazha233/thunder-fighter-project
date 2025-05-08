live;
depth = DEPTH_BATTLE.EXPLOSION
image_speed = 0
image_index = 1
image_yscale = 0.3
image_angle = 40
Anim_Create(id,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_angle,-70,25)
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_xscale,12,30)
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_yscale,image_yscale*20,30)
Anim_Create(id,"image_alpha",0,0,image_alpha,-image_alpha,30)

alarm[0] = 30