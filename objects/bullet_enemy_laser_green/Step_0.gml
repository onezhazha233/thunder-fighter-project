live;
time += 1
for(i=0;i<3;i+=1){
	effect_dist[i] = max(0,effect_dist[i]-7);
}
if(state = 0){
	pause -= 1;
	if(pause = 0){
		SetState(1);
	}
	if(time mod 16 = 1){
		Anim_Create(id,"ring_scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,5,-5,16);
	}
	ball_scale_x = 1 + sin(time*5)*0.2;
	ball_scale_y = 1 + sin(time*5)*0.2;
	if(time mod 1 = 0){
		for(i=0;i<3;i+=1){
			if(effect_dist[i] = 0){
				effect_dir[i] = random(360);
				effect_dist[i] = random_range(60,100);
			}
		}
	}
}
if(state = 1){
	ball_scale_x = 1;
	if(time = 1){
		Anim_Create(id,"ball_scale_x",0,0,1,10,4);
		Anim_Create(id,"ball_offset",0,0,0,15*10,4);
	}
	if(time = 5){
		SetState(2);
	}
}
if(state = 2){
	if(time mod 2 = 0){
		laser_image = !laser_image;
	}
	duration -= 1;
	if(duration = 0){
		SetState(3);
	}
}
if(state = 3){
	if(laser_scale < 0.1)instance_destroy();
	if(time = 1){
		laser_image = 0;
		Anim_Create(id,"laser_scale",0,0,laser_scale,-laser_scale,12);
	}
	if(time = 4){
		laser_image = 1;
	}
}