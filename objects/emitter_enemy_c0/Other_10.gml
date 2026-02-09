live;
if(time >= 1&&time <= 1+6*7){
	if((time-1) mod 6 = 0){
		switch((time-1) div 6){
			case 0:
			case 6:
				blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_red_1);
				blt.image_angle = -90;
				blt.vspeed = 7;
				break;
			case 1:
			case 5:
				blt = MakeEnemyBullet(x-20,y,bullet_enemy_red,spr_bullet_enemy_red_1);
				blt.image_angle = -90;
				blt.hspeed = -0.5;
				blt.vspeed = 7;
				blt = MakeEnemyBullet(x+20,y,bullet_enemy_red,spr_bullet_enemy_red_1);
				blt.image_angle = -90;
				blt.hspeed = 0.5;
				blt.vspeed = 7;
				break;
			case 2:
			case 4:
				blt = MakeEnemyBullet(x-40,y,bullet_enemy_red,spr_bullet_enemy_red_1);
				blt.image_angle = -90;
				blt.hspeed = -1;
				blt.vspeed = 7;
				blt = MakeEnemyBullet(x+40,y,bullet_enemy_red,spr_bullet_enemy_red_1);
				blt.image_angle = -90;
				blt.hspeed = 1;
				blt.vspeed = 7;
				break;
			case 3:
				blt = MakeEnemyBullet(x-60,y,bullet_enemy_red,spr_bullet_enemy_red_1);
				blt.image_angle = -90;
				blt.hspeed = -1.5;
				blt.vspeed = 7;
				blt = MakeEnemyBullet(x+60,y,bullet_enemy_red,spr_bullet_enemy_red_1);
				blt.image_angle = -90;
				blt.hspeed = 1.5;
				blt.vspeed = 7;
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
		blt = MakeEnemyBullet(x-55,y+45,bullet_enemy_red,spr_bullet_enemy_red_1);
		blt.image_angle = -90 + dir;
		blt.direction = blt.image_angle;
		blt.speed = 10;
		blt = MakeEnemyBullet(x+55,y+45,bullet_enemy_red,spr_bullet_enemy_red_1);
		blt.image_angle = -90 + dir;
		blt.direction = blt.image_angle;
		blt.speed = 10;
	}
}
if(time >= 150&&time <= 150+7*6){
	if((time-150) mod 7 = 0){
		blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_red_3);
		blt.rotate = 3;
		blt.direction = -90;
		blt.speed = 10+((time-150) div 7)*3;
		Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
		blt = MakeEnemyBullet(x-20,y-5,bullet_enemy_red,spr_bullet_enemy_red_3);
		blt.rotate = 3;
		blt.direction = -90;
		blt.speed = 10+((time-150) div 7)*3;
		Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
		blt = MakeEnemyBullet(x+20,y-5,bullet_enemy_red,spr_bullet_enemy_red_3);
		blt.rotate = 3;
		blt.direction = -90;
		blt.speed = 10+((time-150) div 7)*3;
		Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
		
		blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_red_3);
		blt.rotate = 3;
		blt.direction = -90+20;
		blt.speed = 10+((time-150) div 7)*3;
		Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
		blt = MakeEnemyBullet(x-20,y-5,bullet_enemy_red,spr_bullet_enemy_red_3);
		blt.rotate = 3;
		blt.direction = -90+20;
		blt.speed = 10+((time-150) div 7)*3;
		Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
		blt = MakeEnemyBullet(x+20,y-5,bullet_enemy_red,spr_bullet_enemy_red_3);
		blt.rotate = 3;
		blt.direction = -90+20;
		blt.speed = 10+((time-150) div 7)*3;
		Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
		
		blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_red_3);
		blt.rotate = 3;
		blt.direction = -90-20;
		blt.speed = 10+((time-150) div 7)*3;
		Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
		blt = MakeEnemyBullet(x-20,y-5,bullet_enemy_red,spr_bullet_enemy_red_3);
		blt.rotate = 3;
		blt.direction = -90-20;
		blt.speed = 10+((time-150) div 7)*3;
		Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
		blt = MakeEnemyBullet(x+20,y-5,bullet_enemy_red,spr_bullet_enemy_red_3);
		blt.rotate = 3;
		blt.direction = -90-20;
		blt.speed = 10+((time-150) div 7)*3;
		Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
	}
}
if(time >= 220&&time <= 220+20){
		dir = 0;
		n0 = 4;
		n1 = 20;
		j = (time-220);
		for(i=0;i<n0;i+=1){
			blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_red_0);
			blt.direction = 360/n0*i;
			blt.image_angle = blt.direction;
			Anim_Create(blt,"speed",0,0,10,-10,30);
			Anim_Create(blt,"direction",0,0,0,blt.direction-180+j*360/n1,0,30);
			Anim_Create(blt,"image_angle",0,0,0,blt.image_angle-180+j*360/n1,0,30);
			Anim_Create(blt,"speed",0,0,3+j/5,-10-j/3,60+j*3,30);
		}
		for(i=0;i<n0;i+=1){
			blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_red_0);
			blt.direction = 360/n0*i;
			blt.image_angle = blt.direction;
			Anim_Create(blt,"speed",0,0,-10,10,30);
			Anim_Create(blt,"direction",0,0,0,blt.direction-180+j*360/n1,0,30);
			Anim_Create(blt,"image_angle",0,0,0,blt.image_angle-180+j*360/n1,0,30);
			Anim_Create(blt,"speed",0,0,3+j/5,-10-j/3,60+j*3,30);
		}
}