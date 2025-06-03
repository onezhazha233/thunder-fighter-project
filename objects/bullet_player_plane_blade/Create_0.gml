live;
event_inherited();

collision_type  = COLLISION_TYPE.SPRITE

damage = 1
damage_type = 1
damage_interval = 999
collision_destroy = false

alarm[1] = 12

image_speed = 0
image_xscale = 2.25
image_yscale = 2.25
Anim_Create(id,"image_xscale",0,0,2.25,4.84-2.25,2)
Anim_Create(id,"image_yscale",0,0,2.25,1.71-2.25,2)
Anim_Create(id,"image_yscale",0,0,1.70,-1.71,10,2)