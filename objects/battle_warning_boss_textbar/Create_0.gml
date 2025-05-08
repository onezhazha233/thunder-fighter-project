live;
lv = 0
name = Lang_GetString("battle.testboss.name")

image_xscale = 5
image_yscale = 5
image_alpha = 0
Anim_Create(id,"image_alpha",0,0,0,1,12,64)
Anim_Create(id,"image_xscale",0,0,image_xscale,1-image_xscale,12,64)
Anim_Create(id,"image_yscale",0,0,image_yscale,0.90-image_yscale,12,64)
Anim_Create(id,"image_yscale",0,0,0.9,0.1,4,64+12)
Anim_Create(id,"image_alpha",0,0,1,-1,10,210)