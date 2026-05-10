live;
enabled = true
if(mode = 0){
	scale = 2;
	Anim_Create(id,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,scale,0-scale,20);
	alpha = 1;
	Anim_Create(id,"alpha",0,0,1,-1,20);
}
if(mode = 1){
	scale = 0.5;
	Anim_Create(id,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,scale,3-scale,20);
	alpha = 1;
	Anim_Create(id,"alpha",0,0,1,-1,20);
}