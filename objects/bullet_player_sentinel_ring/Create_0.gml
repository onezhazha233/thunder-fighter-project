live;
depth = DEPTH_BATTLE.INSTANCES_UPPER

time = 0
scale = 2.1
color = [50,172,56]//[193,141,22],[55,106,154]
light_scale = 0.4
light_r = 255
light_g = 255
light_b = 255
light_alpha = 1
Anim_Create(id,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,scale,0.4-scale,8)
Anim_Create(id,"light_scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.4,0.2,4,8)
Anim_Create(id,"light_scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.6,-0.3,6,12)
Anim_Create(id,"light_r",0,0,255,color[0]-255,4,12)
Anim_Create(id,"light_g",0,0,255,color[1]-255,4,12)
Anim_Create(id,"light_b",0,0,255,color[2]-255,4,12)
Anim_Create(id,"light_alpha",0,0,1,-1,4,14)