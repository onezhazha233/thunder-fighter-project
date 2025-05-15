function EnemyMove_2(){
	if(time = 1){
		x = 200;
		y = -200;
		Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,320-y,40);
	}
	if(time = 60){
		SetState(ENEMY_STAT.INTRO);
	}
	if((time-100) mod 200 = 0){
		Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,x,-100,100);
		Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,x-100,100,100,100);
		Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,y,-100,100);
		Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,y-100,100,100,100);
	}
}