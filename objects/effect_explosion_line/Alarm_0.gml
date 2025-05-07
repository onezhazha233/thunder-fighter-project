live;
Anim_Create(id,"visible",0,0,0,1,0,delay)
Anim_Create(id,"b",0,0,b,-b,5,delay+5)
Anim_Create(id,"g",0,0,g,-128,5,delay+10)
Anim_Create(id,"image_alpha",0,0,1,-1,10,delay+5)
Anim_Create(id,"image_xscale",0,0,image_xscale,image_xscale*5,15,delay)
Anim_Create(id,"image_yscale",0,0,image_yscale,-image_yscale/2,15,delay)

alarm[1] = delay + 15