live;
event_inherited();

image_xscale = 0.18
vspeed = 22.5

sy = 0
Anim_Create(id,"sy",0,0,0,1.5-sy,8)

damage = 1.5*Flag_Get(FLAG_SETTINGS,"enemy_damage_ratio")