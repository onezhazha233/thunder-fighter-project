function EnemyMove_Pre(start_pos,target_pos,duration,delay=0){
	if(time = 1){
		x = start_pos[0];
		y = start_pos[1];
		Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,start_pos[0],target_pos[0]-start_pos[0],duration,delay);
		Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,start_pos[1],target_pos[1]-start_pos[1],duration,delay);
	}
}

function EnemyMove_Intro(itime){
	if(time = itime){
		SetState(ENEMY_STAT.INTRO);
	}
}

function EnemyMove_LoopLinear(start_pos,target_pos,start_time,duration,delay=0){
	if(time >= start_time){
		if((time-start_time) mod (duration+delay) = 0){
			Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,start_pos[0],target_pos[0]-start_pos[0],duration/2);
			Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,start_pos[1],target_pos[1]-start_pos[1],duration/2);
			Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,target_pos[0],start_pos[0]-target_pos[0],duration/2,duration/2+delay);
			Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,target_pos[1],start_pos[1]-target_pos[1],duration/2,duration/2+delay);
		}
	}
}

function EnemyMove_LoopEllipse(width,height,pos,dir,start_time,duration){
	if(dir = 0){
		dirr = 1;
	}
	else{
		dirr = -1;
	}
    if(time >= start_time){
		if((time-start_time) mod duration = 0){
			switch(pos){
				case 0:
					Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,x,-width,duration/2);
					Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.OUT,y,-height/2*dirr,duration/4);
					Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN,y-height/2*dirr,height/2*dirr,duration/4,duration/4);
						
					Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,x-width,width,duration/2,duration/2);
					Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.OUT,y,height/2*dirr,duration/4,duration/2);
					Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN,y+height/2*dirr,-height/2*dirr,duration/4,duration/4+duration/2);
					break;
					
				case 1:
					Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,y,height,duration/2);
					Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.OUT,x,-width/2*dirr,duration/4);
					Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN,x-width/2*dirr,width/2*dirr,duration/4,duration/4);
						
					Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,y+height,-height,duration/2,duration/2);
					Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.OUT,x,width/2*dirr,duration/4,duration/2);
					Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN,x+width/2*dirr,-width/2*dirr,duration/4,duration/4+duration/2);
					break;
					
				case 2:
					Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,x,width,duration/2);
					Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.OUT,y,height/2*dirr,duration/4);
					Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN,y+height/2*dirr,-height/2*dirr,duration/4,duration/4);
						
					Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,x+width,-width,duration/2,duration/2);
					Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.OUT,y,-height/2*dirr,duration/4,duration/2);
					Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN,y-height/2*dirr,height/2*dirr,duration/4,duration/4+duration/2);
					break;
						
				case 3:
					Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,y,-height,duration/2);
					Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.OUT,x,width/2*dirr,duration/4);
					Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN,x+width/2*dirr,-width/2*dirr,duration/4,duration/4);
						
					Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,y-height,height,duration/2,duration/2);
					Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.OUT,x,-width/2*dirr,duration/4,duration/2);
					Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN,x-width/2*dirr,width/2*dirr,duration/4,duration/4+duration/2);
					break;
			}
		}
	}
}

function EnemyMove_1bl(){
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

function EnemyMove_1br(){
	if(time = 1){
		x = 520;
		y = -200;
		Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,320-y,40);
	}
	if(time = 60){
		SetState(ENEMY_STAT.INTRO);
	}
	if((time-100) mod 200 = 0){
		Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,x,100,100);
		Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,x+100,-100,100,100);
		Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,y,-100,100);
		Anim_Create(id,"y",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,y-100,100,100,100);
	}
}

function EnemyMove_1c0(){
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