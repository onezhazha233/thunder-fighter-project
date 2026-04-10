live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE
collision_destroy = false

damage = 1
damage_type = 1
damage_interval = 999

image_speed = 0

dir = 0
scale = 1
angle = 0

Anim_Create(id,"image_index",0,0,0,4,12)
Anim_Create(id,"image_index",0,0,4,1,12,2)
Anim_Create(id,"angle",0,0,30,-60,9)
Anim_Create(id,"angle",0,0,-30,-10,7,9)

image_xscale = 0

duration = 16