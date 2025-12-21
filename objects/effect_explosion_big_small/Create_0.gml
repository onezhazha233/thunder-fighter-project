live;
depth = DEPTH_BATTLE.EXPLOSION
image_angle = random(360)
image_speed = 0
Anim_Create(id,"image_index",0,0,0,7,24)
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,24)
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,24)
Anim_Create(id,"image_alpha",0,0,1,-1,8,16)

alarm[0] = 24

sound = false
alarm[1] = 1