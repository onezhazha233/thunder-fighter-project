live;
Anim_Create(id,"visible",0,0,0,1,0,delay)
Anim_Create(id,"vspeed",0,0,0,-0.5,0,delay)
Anim_Create(id,"image_alpha",0,0,1,-1,20,delay)
Anim_Create(id,"image_angle",0,0,image_angle,random_range(-120,120),20,delay)
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,20,delay)
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,20,delay)
Anim_Create(id,"g",0,0,g,-g,20,delay)

alarm[1] = delay + 20