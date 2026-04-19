live;
event_inherited();

attack_empty_30 = function(){//30帧前摇
	if(attack_time = 30){
		end_attack();
	}
}

attack_0 = function(){//中4散弹 60
	if(attack_time = 1){
		for(i=0;i<6;i+=1){
			a = MakeEnemyBullet(x,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90-30-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
			a = MakeEnemyBullet(x,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90-50-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
			a = MakeEnemyBullet(x,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90+30+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
			a = MakeEnemyBullet(x,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90+50+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
		}
	}
	if(attack_time = 20){
		for(i=0;i<6;i+=1){
			a = MakeEnemyBullet(x,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
			a = MakeEnemyBullet(x,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90-20-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
			a = MakeEnemyBullet(x,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
			a = MakeEnemyBullet(x,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90+20+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
		}
	}
	if(attack_time = 40){
		for(i=0;i<6;i+=1){
			a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
			a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90-20+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
			a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
			a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90+20-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
		}
	}
	if(attack_time = 60){
		for(i=0;i<6;i+=1){
			a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90-30+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
			a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90-50+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
			a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90+30-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
			a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90+50-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
		}
	}
	if(attack_time = 60)end_attack();
}

attack_1 = function(){//中3散弹 150
	if(attack_time mod 3 = 0){
		tt = attack_time div 3;
		a = MakeEnemyBullet(x,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = -90-45+sin(tt/2)*20;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,3,10,50);
		a = MakeEnemyBullet(x,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = -90+45+sin(tt/2)*20;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,3,10,50);
		a = MakeEnemyBullet(x,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = -90+sin(tt/2)*20;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,3,10,50);
	}
	if(attack_time = 150)end_attack();
}
	
attack_2 = function(){//机枪 60
	if(attack_time = 1){
		mark.SetSequence(seq_enemy_boss_large_1_p2_attack_0);
	}
	if(attack_time mod 3 = 0){
		tt = attack_time div 3;
		if(tt mod 2 = 0){
			for(i=0;i<5;i+=1){
				a = MakeEnemyBullet(x-147,y+117,bullet_enemy_normal,spr_bullet_enemy_normal_3);
				a.rotate = 3;
				a.direction = -90-50+i*20;
				Anim_Create(a,"speed",0,0,5,8,30);
				a = MakeEnemyBullet(x+147,y+117,bullet_enemy_normal,spr_bullet_enemy_normal_3);
				a.rotate = -3;
				a.direction = -90-50+i*20;
				Anim_Create(a,"speed",0,0,5,8,30);
			}
		}
		else{
			for(i=0;i<4;i+=1){
				a = MakeEnemyBullet(x-147,y+117,bullet_enemy_normal,spr_bullet_enemy_normal_3);
				a.rotate = 3;
				a.direction = -90-40+i*20;
				Anim_Create(a,"speed",0,0,5,8,30);
				a = MakeEnemyBullet(x+147,y+117,bullet_enemy_normal,spr_bullet_enemy_normal_3);
				a.rotate = -3;
				a.direction = -90-40+i*20;
				Anim_Create(a,"speed",0,0,5,8,30);
			}
		}
	}
	if(attack_time = 59){
		mark.SetIdle();
	}
	if(attack_time = 60)end_attack();
}
	
attack_3 = function(){//长侧封位弹（触侧反弹） 180+exarg
	if(attack_time mod 5 = 0){
		a = MakeEnemyBullet(x-220,y+200,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = -90;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x+220,y+200,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = -90;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x-220,y+200,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = -90+45;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x-220,y+200,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = -90-45;
		a.direction = a.image_angle;
		a.bounced = false;
		Anim_Create(a,"speed",0,0,10,6,30);
		with(a){
			custom_function = function(){
				if(x <= 0&&bounced = false){
					bounced = true;
					x = 0;
					hspeed *= -0.6;
					image_angle = direction;
				}
			}
		}
		a = MakeEnemyBullet(x+220,y+200,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = -90-45;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x+220,y+200,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = -90+45;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a.bounced = false;
		with(a){
			custom_function = function(){
				if(x >= room_width-0&&bounced = false){
					bounced = true;
					x = room_width;
					hspeed *= -0.6;
					image_angle = direction;
				}
			}
		}
	}
	if(attack_time = 180)end_attack();
}
	
attack_4 = function(){//侧狙 40
	if(attack_time = 1){
		dir0 = point_direction(x-220,y+200,player.x,player.y);
		dir1 = point_direction(x+220,y+200,player.x,player.y);
		mark.SetMoveEnabled(false);
	}
	if(attack_time mod 4 = 0){
		a = MakeEnemyBullet(x-220,y+200,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = dir0+30;
		a.direction = a.image_angle;
		a.speed = 12;
		for(i=0;i<10;i+=1){
			Anim_Create(a,"direction",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.direction,-60,20,i*40);
			Anim_Create(a,"direction",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.direction-60,60,20,20+i*40);
			Anim_Create(a,"image_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.image_angle,-60,20,i*40);
			Anim_Create(a,"image_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.image_angle-60,60,20,20+i*40);
		}
		a = MakeEnemyBullet(x-220,y+200,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = dir0-30;
		a.direction = a.image_angle;
		a.speed = 12;
		for(i=0;i<10;i+=1){
			Anim_Create(a,"direction",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.direction,60,20,i*40);
			Anim_Create(a,"direction",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.direction+60,-60,20,20+i*40);
			Anim_Create(a,"image_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.image_angle,60,20,i*40);
			Anim_Create(a,"image_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.image_angle+60,-60,20,20+i*40);
		}
		a = MakeEnemyBullet(x+220,y+200,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = dir1-30;
		a.direction = a.image_angle;
		a.speed = 12;
		for(i=0;i<10;i+=1){
			Anim_Create(a,"direction",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.direction,60,20,i*40);
			Anim_Create(a,"direction",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.direction+60,-60,20,20+i*40);
			Anim_Create(a,"image_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.image_angle,60,20,i*40);
			Anim_Create(a,"image_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.image_angle+60,-60,20,20+i*40);
		}
		a = MakeEnemyBullet(x+220,y+200,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = dir1+30;
		a.direction = a.image_angle;
		a.speed = 12;
		for(i=0;i<10;i+=1){
			Anim_Create(a,"direction",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.direction,-60,20,i*40);
			Anim_Create(a,"direction",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.direction-60,60,20,20+i*40);
			Anim_Create(a,"image_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.image_angle,-60,20,i*40);
			Anim_Create(a,"image_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.image_angle-60,60,20,20+i*40);
		}
	}
	if(attack_time = 40){
		end_attack();
		mark.SetMoveEnabled(true);
	}
}


var ae = create_attack(999, attack_empty_30);
var a0 = create_attack(0, attack_0,30);
var a1 = create_attack(1, attack_1,30);
var a2 = create_attack(2, attack_2,30);
var a3 = create_attack(3, attack_3,20);
var a4 = create_attack(4, attack_4,60);

fixed_sequence = [ae,a0,a1,a2,a3,a4,a0,a4,a1,a3,a2,a0,a1];
random_pool = [a0,a1,a2,a3,a4]