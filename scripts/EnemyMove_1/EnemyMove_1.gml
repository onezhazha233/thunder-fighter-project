function EnemyMove_1(){
	if(time = 1){
		x = 360;
		y = -200;
		Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,400-y,40);
	}
	if(time = 60){
		SetState(ENEMY_STAT.INTRO);
	}
	if((time-120) mod 300 = 0){
		Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,y,-150,150);
		Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN,y-150,150,150,150);
	}
}