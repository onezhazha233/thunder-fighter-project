live;
event_inherited();

if(instance_exists(cs0)){
	Anim_Create(cs0,"offset",0,0,cs0.offset,-cs0.offset,20);
	Anim_Create(cs1,"offset",0,0,cs1.offset,-cs1.offset,20);
	cs0.duration = 20;
	cs1.duration = 20;
}