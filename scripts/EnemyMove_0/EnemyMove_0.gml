function EnemyMove_0(){
	if(time = 1){
		x = 360;
		y = -200;
		Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,320-y,40);
	}
	if(time = 60){
		SetState(ENEMY_STAT.INTRO);
	}
	if(time = 100){
		Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,x,120,120);
		Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN,y,60,120);
	}
	if((time-220) mod 480 = 0){
		Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,x,-240,240);
		Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,x-240,240,240,240);
		Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.OUT,y,60,120);
		Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,y+60,-120,240,120);
		Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN,y-60,60,120,360);
	}
}