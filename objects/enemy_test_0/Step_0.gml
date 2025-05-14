live;
event_inherited();

if(time = 40){
	Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,320-y,40);
}
if(time = 80){
	SetState(1);
}