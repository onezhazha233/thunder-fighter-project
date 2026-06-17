live;
Anim_Create(id,"angle",0,0,angle,angles[angle_index]-angle-90,5)
angle_index += 1
if(angle_index > 3)angle_index = 0;
alarm[2] = time_interval_idle[weapon_level]-12