live;
event_inherited();

collision_type = COLLISION_TYPE.SPRITE

damage = 1
damage_type = 1
damage_interval = 999
collision_destroy = false

image_speed = 0
rampage = false
time = 0

collision_effect = seq_bullet_effect_shotcannon
collision_effect_scale_x = rampage = true ? 1.5 : 1
collision_effect_scale_y = rampage = true ? 1.5 : 1