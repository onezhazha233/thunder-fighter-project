live;
duration -= 1
if(duration = 10)Anim_Create(id,"image_alpha",0,0,1,-1,10);
if(duration <= 0){
	instance_destroy();
}