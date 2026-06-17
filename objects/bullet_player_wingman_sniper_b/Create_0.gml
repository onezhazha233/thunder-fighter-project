live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE
collision_destroy = false
collision_effect = seq_bullet_effect_sniper

damage_type = 0

image_speed = 0
vspeed = 48
image_xscale = 4
image_yscale = 0
Anim_Create(id,"image_xscale",0,0,image_xscale,1-image_xscale,4)
Anim_Create(id,"image_xscale",0,0,1,1,20,4)
Anim_Create(id,"image_yscale",0,0,image_yscale,1-image_yscale,4)
Anim_Create(id,"image_yscale",0,0,1,1,10,4)
Anim_Create(id,"image_yscale",0,0,2,-1,10,14)

damage = 1