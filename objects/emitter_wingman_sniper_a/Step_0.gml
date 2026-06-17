live;
event_inherited();

if(angle_index > 3)angle_index = 0;

if(enabled = false){
	if(!Anim_IsExists(id,"angle")&&angle != 0)Anim_Create(id,"angle",0,0,angle,-angle,5);
	angle_index = 0;
	alarm[2] = -1;
}