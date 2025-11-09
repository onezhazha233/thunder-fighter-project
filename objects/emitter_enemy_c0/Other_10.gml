live;
if(time >= 1&&time <= 1+6*7){
	if((time-1) mod 6 = 0){
		switch((time-1) div 6){
			case 0:
			case 6:
				a = instance_create_depth(x,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.vspeed = 7;
				a.mark = mark;
				break;
			case 1:
			case 5:
				a = instance_create_depth(x-20,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.hspeed = -0.5;
				a.vspeed = 7;
				a.mark = mark;
				a = instance_create_depth(x+20,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.hspeed = 0.5;
				a.vspeed = 7;
				a.mark = mark;
				break;
			case 2:
			case 4:
				a = instance_create_depth(x-40,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.hspeed = -1;
				a.vspeed = 7;
				a.mark = mark;
				a = instance_create_depth(x+40,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.hspeed = 1;
				a.vspeed = 7;
				a.mark = mark;
				break;
			case 3:
				a = instance_create_depth(x-60,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.hspeed = -1.5;
				a.vspeed = 7;
				a.mark = mark;
				a = instance_create_depth(x+60,y,0,bullet_enemy_red);
				a.sprite_index = spr_bullet_enemy_red_1;
				a.image_angle = -90;
				a.hspeed = 1.5;
				a.vspeed = 7;
				a.mark = mark;
				break;
		}
	}
}
if(time >= 70&&time <= 70+2*30){
	if((time-70) div 2 = 0){
		dir = 0;
		Anim_Create(id,"dir",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,-10,12);
		Anim_Create(id,"dir",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-10,20,12,12);
		Anim_Create(id,"dir",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,10,-20,12,24);
		Anim_Create(id,"dir",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-10,20,12,36);
		Anim_Create(id,"dir",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,10,-10,12,48);
	}
	if((time-90) mod 2 = 0){
		a = instance_create_depth(x-55,y+45,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_1;
		a.image_angle = -90 + dir;
		a.direction = a.image_angle;
		a.speed = 10;
		a.mark = mark;
		a = instance_create_depth(x+55,y+45,0,bullet_enemy_red);
		a.sprite_index = spr_bullet_enemy_red_1;
		a.image_angle = -90 + dir;
		a.direction = a.image_angle;
		a.speed = 10;
		a.mark = mark;
	}
}
if(time >= 150&&time <= 150+7*6){
	if((time-150) mod 7 = 0){
		a = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_red_3);
		a.rotate = 3;
		a.direction = -90;
		a.speed = 10+((time-150) div 7)*3;
		Anim_Create(a,"speed",0,0,a.speed,-a.speed*0.6,10);
		a = MakeEnemyBullet(x-20,y-5,bullet_enemy_red,spr_bullet_enemy_red_3);
		a.rotate = 3;
		a.direction = -90;
		a.speed = 10+((time-150) div 7)*3;
		Anim_Create(a,"speed",0,0,a.speed,-a.speed*0.6,10);
		a = MakeEnemyBullet(x+20,y-5,bullet_enemy_red,spr_bullet_enemy_red_3);
		a.rotate = 3;
		a.direction = -90;
		a.speed = 10+((time-150) div 7)*3;
		Anim_Create(a,"speed",0,0,a.speed,-a.speed*0.6,10);
		
		a = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_red_3);
		a.rotate = 3;
		a.direction = -90+20;
		a.speed = 10+((time-150) div 7)*3;
		Anim_Create(a,"speed",0,0,a.speed,-a.speed*0.6,10);
		a = MakeEnemyBullet(x-20,y-5,bullet_enemy_red,spr_bullet_enemy_red_3);
		a.rotate = 3;
		a.direction = -90+20;
		a.speed = 10+((time-150) div 7)*3;
		Anim_Create(a,"speed",0,0,a.speed,-a.speed*0.6,10);
		a = MakeEnemyBullet(x+20,y-5,bullet_enemy_red,spr_bullet_enemy_red_3);
		a.rotate = 3;
		a.direction = -90+20;
		a.speed = 10+((time-150) div 7)*3;
		Anim_Create(a,"speed",0,0,a.speed,-a.speed*0.6,10);
		
		a = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_red_3);
		a.rotate = 3;
		a.direction = -90-20;
		a.speed = 10+((time-150) div 7)*3;
		Anim_Create(a,"speed",0,0,a.speed,-a.speed*0.6,10);
		a = MakeEnemyBullet(x-20,y-5,bullet_enemy_red,spr_bullet_enemy_red_3);
		a.rotate = 3;
		a.direction = -90-20;
		a.speed = 10+((time-150) div 7)*3;
		Anim_Create(a,"speed",0,0,a.speed,-a.speed*0.6,10);
		a = MakeEnemyBullet(x+20,y-5,bullet_enemy_red,spr_bullet_enemy_red_3);
		a.rotate = 3;
		a.direction = -90-20;
		a.speed = 10+((time-150) div 7)*3;
		Anim_Create(a,"speed",0,0,a.speed,-a.speed*0.6,10);
	}
}
if(time >= 220&&time <= 220+20){
		dir = 0;
		n0 = 4;
		n1 = 20;
		j = (time-220);
		for(i=0;i<n0;i+=1){
			a = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.direction = 360/n0*i;
			a.image_angle = a.direction;
			Anim_Create(a,"speed",0,0,10,-10,30);
			Anim_Create(a,"direction",0,0,0,a.direction-180+j*360/n1,0,30);
			Anim_Create(a,"image_angle",0,0,0,a.image_angle-180+j*360/n1,0,30);
			Anim_Create(a,"speed",0,0,3+j/5,-10-j/3,60+j*3,30);
		}
		for(i=0;i<n0;i+=1){
			a = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.direction = 360/n0*i;
			a.image_angle = a.direction;
			Anim_Create(a,"speed",0,0,-10,10,30);
			Anim_Create(a,"direction",0,0,0,a.direction-180+j*360/n1,0,30);
			Anim_Create(a,"image_angle",0,0,0,a.image_angle-180+j*360/n1,0,30);
			Anim_Create(a,"speed",0,0,3+j/5,-10-j/3,60+j*3,30);
		}
}