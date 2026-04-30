live;
time += 1
if(state = 0){
	if(time = 1){
		Anim_Create(id,"up_y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,up_y,-up_y,55);
		Anim_Create(id,"down_y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,down_y,-down_y,55);
		audio_play_sound(snd_loading_intro,0,0);
	}
	if(time = 60){
		Anim_Create(id,"center_alpha",0,0,0,1,20);
	}
	if(time = 80){
		Anim_Create(id,"text_alpha_0",0,0,0,1,20);
	}
	if(time = 100){
		state = 1;
	}
}
if(state = 2){
	if(time = 1){
		Anim_Create(id,"light_alpha",0,0,0,1,15);
		Anim_Create(id,"light_alpha",0,0,1,-1,15,30);
		Anim_Create(id,"text_alpha_0",0,0,1,-1,10);
		Anim_Create(id,"text_alpha_1",0,0,0,1,10);
	}
	if(time = 50){
		Anim_Create(id,"center_alpha",0,0,1,-1,20);
		Anim_Create(id,"text_alpha_1",0,0,1,-1,10);
	}
	if(time = 70){
		Anim_Create(id,"up_y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,up_y,-560,30);
		Anim_Create(id,"down_y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,down_y,800,30);
		audio_play_sound(snd_loading_outro,0,0);
	}
	if(time = 100){
		instance_destroy();
	}
}