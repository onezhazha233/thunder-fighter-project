live;
image_xscale = 2
Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,-520*scale_y,10)
Anim_Create(id,"y",0,0,y-520*scale_y,-50*scale_y,4,10)
Anim_Create(id,"image_yscale",0,0,1,1,6)
Anim_Create(id,"image_yscale",0,0,2,-1,6,8)
Anim_Create(id,"image_alpha",0,0,1,-1,8,6)