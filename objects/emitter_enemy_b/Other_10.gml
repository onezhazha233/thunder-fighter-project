live;
if(time >= 1&&time <= 1+5*5){
	if((time-1) mod 5 = 0){
		dd = point_direction(x,y,player.x,player.y);
		a = instance_create_depth(x,y,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_1;
		a.image_angle = dd;
		a.direction = a.image_angle;
		a.speed = -15;
		Anim_Create(a,"speed",0,0,-15,25,25);
		a.mark = mark;
	}
}
if(time >= 20&&time <= 20+3*7){
	if((time-20) mod 3 = 0){
		dd = point_direction(x,y,player.x,player.y);
		a = instance_create_depth(x,y,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_1;
		a.image_angle = dd - 60;
		a.direction = a.image_angle;
		Anim_Create(a,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.image_angle,90-((time-1) div 3)*2,40);
		Anim_Create(a,"direction",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.direction,90-((time-1) div 3)*2,40);
		a.speed = 15;
		a.mark = mark;
		a = instance_create_depth(x,y,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_1;
		a.image_angle = dd + 60;
		a.direction = a.image_angle;
		Anim_Create(a,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.image_angle,-90+((time-1) div 3)*2,40);
		Anim_Create(a,"direction",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.direction,-90+((time-1) div 3)*2,40);
		a.speed = 15;
		a.mark = mark;
	}
}
if(time >= 90&&time <= 90+3*4){
	if((time-90) mod 3 = 0){
		if((time-90) div 3 = 0){
			pd = point_direction(x,y,player.x,player.y);
		}
		for(i=0;i<5;i+=1){
			dd = pd + ((time-60) div 3)*5;
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_1;
			a.image_angle = 72*i+dd;
			a.direction = a.image_angle;
			a.speed = 20;
			Anim_Create(a,"speed",0,0,20,-12,3);
			a.mark = mark;
		}
	}
}
if(time >= 120&&time <= 120+3*4){
	if((time-120) mod 3 = 0){
		if((time-120) div 3 = 0){
			pd = point_direction(x,y,player.x,player.y);
		}
		for(i=0;i<5;i+=1){
			dd = pd - ((time-60) div 3)*5;
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_1;
			a.image_angle = 72*i+dd;
			a.direction = a.image_angle;
			a.speed = 20;
			Anim_Create(a,"speed",0,0,20,-12,3);
			a.mark = mark;
		}
	}
}
if(time >= 180&&time <= 180+10*3){
	if((time-180) mod 15 = 0){
		if((time-180) div 15 = 0){
			pd = point_direction(x,y,player.x,player.y);
		}
		for(i=0;i<4;i+=1){
			dd = pd + ((time-180) div 15)*10+5;
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_2;
			a.image_angle = dd;
			a.direction = a.image_angle;
			a.speed = 0;
			Anim_Create(a,"speed",0,0,0,15+i*2,100);
			a.mark = mark;
			dd = pd - ((time-180) div 15)*10-5;
			a = instance_create_depth(x,y,0,bullet_enemy_red);
			a.sprite_index = spr_bullet_enemy_red_2;
			a.image_angle = dd;
			a.direction = a.image_angle;
			a.speed = 0;
			Anim_Create(a,"speed",0,0,0,15+i*2,100);
			a.mark = mark;
		}
	}
}