live;
event_inherited();

duration = -1
loop = false

num0 = 3
angle_range = 90
a1 = 0

rdm_attack = 0
rdm_attack_time = -1
rdm_attack_duration = -1

attack_list = ds_list_create()

function start_attack(attack_type,arg=0){
	attack = {
		type : attack_type,
		time : 0,
		active : true,
		exarg : arg,
		
		End : function(){
			active = false;
		}
	}
	
	ds_list_add(attack_list,attack);
}

function run_attack(attack){
	switch(attack.type){
		case 0: attack_0(attack,attack.exarg); break;
		case 1: attack_1(attack,attack.exarg); break;
		case 2: attack_2(attack,attack.exarg); break;
		case 3: attack_3(attack,attack.exarg); break;
		case 4: attack_4(attack,attack.exarg); break;
		case 5: attack_5(attack,attack.exarg); break;
	}
}

function attack_0(attack,exarg=0){//短散弹 60
	if(attack.time < 30){
		if(attack.time mod 5 = 0){
			tt = (attack.time div 5);
			if(tt = 0){
				for(i=0;i<6;i+=1){
					a = MakeEnemyBullet(x,y+140,bullet_enemy_red,spr_bullet_enemy_red_2);
					a.image_angle = -90;
					a.direction = a.image_angle;
					Anim_Create(a,"speed",0,0,0,15+i*2,50);
				}
			}
			else{
				for(i=0;i<6;i+=1){
					a = MakeEnemyBullet(x,y+140,bullet_enemy_red,spr_bullet_enemy_red_2);
					a.image_angle = -90+tt*15;
					a.direction = a.image_angle;
					Anim_Create(a,"speed",0,0,0,15+i*2,50);
					a = MakeEnemyBullet(x,y+140,bullet_enemy_red,spr_bullet_enemy_red_2);
					a.image_angle = -90-tt*15;
					a.direction = a.image_angle;
					Anim_Create(a,"speed",0,0,0,15+i*2,50);
				}
			}
		}
	}
	else{
		if(attack.time mod 5 = 0){
			tt = (attack.time div 5)-4;
			if(tt = 6){
				for(i=0;i<12;i+=1){
					a = MakeEnemyBullet(x,y+140,bullet_enemy_red,spr_bullet_enemy_red_2);
					a.image_angle = -90;
					a.direction = a.image_angle;
					Anim_Create(a,"speed",0,0,0,20+i*3,50);
				}
			}
			else{
				for(i=0;i<6;i+=1){
					a = MakeEnemyBullet(x,y+140,bullet_enemy_red,spr_bullet_enemy_red_2);
					a.image_angle = -90+(6-tt)*20-(tt mod 2)*3;
					a.direction = a.image_angle;
					Anim_Create(a,"speed",0,0,0,20+i*3,50);
					a = MakeEnemyBullet(x,y+140,bullet_enemy_red,spr_bullet_enemy_red_2);
					a.image_angle = -90-(6-tt)*20+(tt mod 2)*3;
					a.direction = a.image_angle;
					Anim_Create(a,"speed",0,0,0,20+i*3,50);
				}
			}
		}
	}
	if(attack.time = 60)attack.End();
}

function attack_1(attack,exarg=0){//长中散弹 150
	if(attack.time = 1){
		num0 = 3;
		angle_range = 90;
	}
	if(attack.time mod 4 = 0){
		for(i=0;i<num0;i+=1){
			a = MakeEnemyBullet(x,y+140,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90-angle_range/2+i*angle_range/(num0-1);
			a.direction = a.image_angle;
			a.speed = 15;
		}
	}
	if(attack.time = 30){
		num0 = 4;
		angle_range = 120;
	}
	if(attack.time = 60){
		num0 = 5;
		angle_range = 150;
	}
	if(attack.time = 90){
		num0 = 4;
		angle_range = 120;
	}
	if(attack.time = 120){
		num0 = 3;
		angle_range = 90;
	}
	if(attack.time = 150)attack.End();
}

function attack_2(attack,exarg=0){//两侧封位弹 120
	if(attack.time = 1){
		a1 = 0;
	}
	if(attack.time mod 5 = 0){
		a = MakeEnemyBullet(x-145,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = -90-a1;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x+145,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = -90+a1;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
	}
	if(attack.time = 20){
		Anim_Create(id,"a1",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,0,30,20);
		Anim_Create(id,"a1",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,30,-60,40,20);
		Anim_Create(id,"a1",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,-30,30,20,60);
	}
	if(attack.time = 120)attack.End();
}

function attack_3(attack,exarg=0){//侧闪电球 60
	if(attack.time = 1){
		for(i=0;i<3;i+=1){
			a = MakeEnemyBullet(x,y+120,bullet_enemy_lightning_ball,-1);
			a.image_angle = 40;
			a.direction = a.image_angle-90;
			Anim_Create(a,"speed",0,0,15,-9+i*4,20);
			Anim_Create(a,"speed",0,0,6+i*4,20,60,20);
			Anim_Create(a,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,40,-60+i*15,30,10);
			Anim_Create(a,"direction",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-90+40,-60+i*15,30,10);
			a = MakeEnemyBullet(x,y+120,bullet_enemy_lightning_ball,-1);
			a.image_angle = -40;
			a.direction = a.image_angle-90;
			Anim_Create(a,"speed",0,0,15,-9+i*4,20);
			Anim_Create(a,"speed",0,0,6+i*4,20,60,20);
			Anim_Create(a,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-40,60-i*15,30,10);
			Anim_Create(a,"direction",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,-90-40,60-i*15,30,10);
		}
	}
	if(attack.time = 2)attack.End();
}

function attack_4(attack,exarg=0){//中闪电球（触底反弹散射） 100
	if(attack.time = 1){
		a = MakeEnemyBullet(x,y+120,bullet_enemy_lightning_ball,-1);
		a.direction = -90;
		a.speed = 12;
		with(a){
			custom_function = function(){
				if(y >= room_height){
					destroy_type = 3;
					instance_destroy();
					for(i=0;i<7;i+=1){
						a = MakeEnemyBullet(x,y,bullet_enemy_lightning_ball,-1);
						a.image_angle = 180-60+i*120/6;
						a.direction = 90-60+i*120/6;
						a.speed = 8+(i mod 2 = 0 ? 3 : 0);
					}
				}
			}
		}
	}
	if(attack.time = 2)attack.End();
}

function attack_5(attack,exarg=0){//长侧封位弹（触侧反弹） 180+exarg
	if(attack.time mod 5 = 0){
		a = MakeEnemyBullet(x-145,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = -90;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x+145,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = -90;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x-145,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
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
		a = MakeEnemyBullet(x+145,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
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
	if(attack.time = 180+exarg)attack.End();
}