live;
image_alpha = 1;
if(type = 0){
	enabled = true;
	image_xscale = 0.5;
	image_yscale = 0.5;
	image_blend = c_purple;
	Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_xscale,5-image_xscale,5);
	Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_yscale,5-image_yscale,5);
}
else{
	Anim_Create(id,"image_xscale",0,0,image_xscale,-image_xscale,20);
	Anim_Create(id,"image_yscale",0,0,image_yscale,-image_yscale,20);
	alarm[1] = 20;
}