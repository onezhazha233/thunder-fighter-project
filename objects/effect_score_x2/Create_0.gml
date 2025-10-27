live;
depth = DEPTH_BATTLE.ITEM_EFFECTS
image_xscale = 0
image_yscale = 0

Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.4,8)
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.4,8)
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1.4,-0.55,6,8)
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1.4,-0.55,6,8)
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.85,0.15,2,14)
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.85,0.15,2,14)

Anim_Create(id,"y",0,0,y,-35,12,36)
Anim_Create(id,"image_alpha",0,0,1,-1,8,40)

alarm[0] = 48