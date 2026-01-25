live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

rampage = false

damage_type = 1
damage_interval = 5
collision_destroy = false

collision_effect = bullet_effect_xeno
collision_effect_scale_x = (rampage = true ? 1 : 0.6)
collision_effect_scale_y = (rampage = true ? 1 : 0.6)

damage = 0.125