live;
Anim_Create(id,"visible",0,0,0,1,0,delay)
Anim_Create(id,"vspeed",0,0,0,-1.5,0,delay)
Anim_Create(id,"image_angle",0,0,0,choose(-60,60),30,delay)
Anim_Create(id,"image_alpha",0,0,1,-1,30,delay)

alarm[1] = delay + 30