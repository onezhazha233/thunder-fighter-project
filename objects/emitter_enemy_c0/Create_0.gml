live;
event_inherited();

mode = EMITTER_MODE.FIXED

function attack_0(){
	if(attack_time >= 1&&attack_time <= 1+6*7){
		if((attack_time-1) mod 6 = 0){
			switch((attack_time-1) div 6){
				case 0:
				case 6:
					blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
					blt.image_angle = -90;
					blt.vspeed = 7;
					break;
				case 1:
				case 5:
					blt = MakeEnemyBullet(x-20,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
					blt.image_angle = -90;
					blt.hspeed = -0.5;
					blt.vspeed = 7;
					blt = MakeEnemyBullet(x+20,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
					blt.image_angle = -90;
					blt.hspeed = 0.5;
					blt.vspeed = 7;
					break;
				case 2:
				case 4:
					blt = MakeEnemyBullet(x-40,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
					blt.image_angle = -90;
					blt.hspeed = -1;
					blt.vspeed = 7;
					blt = MakeEnemyBullet(x+40,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
					blt.image_angle = -90;
					blt.hspeed = 1;
					blt.vspeed = 7;
					break;
				case 3:
					blt = MakeEnemyBullet(x-60,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
					blt.image_angle = -90;
					blt.hspeed = -1.5;
					blt.vspeed = 7;
					blt = MakeEnemyBullet(x+60,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
					blt.image_angle = -90;
					blt.hspeed = 1.5;
					blt.vspeed = 7;
					break;
			}
		}
	}
	if(attack_time = 50){
		end_attack();
	}
}
	
function attack_1(){
	if(attack_time >= 1&&attack_time <= 2*30){
		if((attack_time-1) div 2 = 0){
			dir = 0;
			Anim_Create(id,"dir",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,-10,12);
			Anim_Create(id,"dir",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-10,20,12,12);
			Anim_Create(id,"dir",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,10,-20,12,24);
			Anim_Create(id,"dir",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-10,20,12,36);
			Anim_Create(id,"dir",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,10,-10,12,48);
		}
		if((attack_time-20) mod 2 = 0){
			blt = MakeEnemyBullet(x-55,y+45,bullet_enemy_normal,spr_bullet_enemy_normal_1);
			blt.image_angle = -90 + dir;
			blt.direction = blt.image_angle;
			blt.speed = 10;
			blt = MakeEnemyBullet(x+55,y+45,bullet_enemy_normal,spr_bullet_enemy_normal_1);
			blt.image_angle = -90 + dir;
			blt.direction = blt.image_angle;
			blt.speed = 10;
		}
	}
	if(attack_time = 60){
		end_attack();
	}
}
	
function attack_2(){
	if(attack_time >= 1&&attack_time <= 7*6){
		if((attack_time-1) mod 7 = 0){
			blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_3);
			blt.rotate = 3;
			blt.direction = -90;
			blt.speed = 10+(attack_time div 7)*3;
			Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
			blt = MakeEnemyBullet(x-20,y-5,bullet_enemy_normal,spr_bullet_enemy_normal_3);
			blt.rotate = 3;
			blt.direction = -90;
			blt.speed = 10+(attack_time div 7)*3;
			Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
			blt = MakeEnemyBullet(x+20,y-5,bullet_enemy_normal,spr_bullet_enemy_normal_3);
			blt.rotate = 3;
			blt.direction = -90;
			blt.speed = 10+(attack_time div 7)*3;
			Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
		
			blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_3);
			blt.rotate = 3;
			blt.direction = -90+20;
			blt.speed = 10+(attack_time div 7)*3;
			Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
			blt = MakeEnemyBullet(x-20,y-5,bullet_enemy_normal,spr_bullet_enemy_normal_3);
			blt.rotate = 3;
			blt.direction = -90+20;
			blt.speed = 10+(attack_time div 7)*3;
			Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
			blt = MakeEnemyBullet(x+20,y-5,bullet_enemy_normal,spr_bullet_enemy_normal_3);
			blt.rotate = 3;
			blt.direction = -90+20;
			blt.speed = 10+(attack_time div 7)*3;
			Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
		
			blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_3);
			blt.rotate = 3;
			blt.direction = -90-20;
			blt.speed = 10+(attack_time div 7)*3;
			Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
			blt = MakeEnemyBullet(x-20,y-5,bullet_enemy_normal,spr_bullet_enemy_normal_3);
			blt.rotate = 3;
			blt.direction = -90-20;
			blt.speed = 10+(attack_time div 7)*3;
			Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
			blt = MakeEnemyBullet(x+20,y-5,bullet_enemy_normal,spr_bullet_enemy_normal_3);
			blt.rotate = 3;
			blt.direction = -90-20;
			blt.speed = 10+(attack_time div 7)*3;
			Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed*0.6,10);
		}
	}
	if(attack_time = 50){
		end_attack();
	}
}
	
function attack_3(){
	if(attack_time >= 1&&attack_time <= 20){
		dir = 0;
		n0 = 4;
		n1 = 20;
		j = attack_time;
		for(i=0;i<n0;i+=1){
			blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			blt.direction = 360/n0*i;
			blt.image_angle = blt.direction;
			Anim_Create(blt,"speed",0,0,10,-10,30);
			Anim_Create(blt,"direction",0,0,0,blt.direction-180+j*360/n1,0,30);
			Anim_Create(blt,"image_angle",0,0,0,blt.image_angle-180+j*360/n1,0,30);
			Anim_Create(blt,"speed",0,0,3+j/5,-10-j/3,60+j*3,30);
		}
		for(i=0;i<n0;i+=1){
			blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			blt.direction = 360/n0*i;
			blt.image_angle = blt.direction;
			Anim_Create(blt,"speed",0,0,-10,10,30);
			Anim_Create(blt,"direction",0,0,0,blt.direction-180+j*360/n1,0,30);
			Anim_Create(blt,"image_angle",0,0,0,blt.image_angle-180+j*360/n1,0,30);
			Anim_Create(blt,"speed",0,0,3+j/5,-10-j/3,60+j*3,30);
		}
	}
	if(attack_time = 20){
		end_attack();
	}
}
	
var a0 = create_attack(0,attack_0,30);
var a1 = create_attack(1,attack_1,20);
var a2 = create_attack(2,attack_2,20);
var a3 = create_attack(3,attack_3,150);

fixed_sequence = [a0,a1,a2,a3];