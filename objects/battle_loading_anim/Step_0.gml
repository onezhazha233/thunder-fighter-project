live;
time += 1
if(state = 0){
	if(time = 1){
		Anim_Create(id,"up_y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,up_y,-up_y,30);
		Anim_Create(id,"down_y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,down_y,-down_y,30);
	}
	if(time = 30){
		Anim_Create(id,"center_alpha",0,0,0,1,20);
	}
	if(time = 50){
		Anim_Create(id,"text_alpha",0,0,0,1,20);
	}
	if(time = 70){
		state = 1;
	}
}
if(state = 2){
	if(time = 1){
		text_image = 1;
	}
	if(time = 30){
		Anim_Create(id,"text_alpha",0,0,1,-1,20);
	}
	if(time = 50){
		Anim_Create(id,"center_alpha",0,0,1,-1,20);
	}
	if(time = 70){
		Anim_Create(id,"up_y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,up_y,-560,30);
		Anim_Create(id,"down_y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,down_y,720,30);
	}
	if(time = 100){
		instance_destroy();
	}
}