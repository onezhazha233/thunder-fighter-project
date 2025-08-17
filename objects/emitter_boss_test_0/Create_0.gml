live;
event_inherited();

duration = -1
loop = false

attack = [-1,-1,-1]
attack_time = [0,0,0]

num0 = 3
angle_range = 90
a1 = 0

attack_list = ds_list_create()

function start_attack(attack_type){
	attack = {
		type : attack_type,
		time : 0,
		active : true
	}
	
	ds_list_add(attack_list,attack);
}

function run_attack(attack){
	switch(attack.type){
		case 0: attack_0(attack);break;
		case 1: attack_1(attack);break;
		case 2: attack_2(attack);break;
		case 3: attack_3(attack);break;
		case 4: attack_4(attack);break;
	}
}

function attack_0(attack){
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
	if(attack.time = 60)attack.active = false;
}

function attack_1(attack){
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
	if(attack.time = 150)attack.active = false;
}

function attack_2(attack){
	if(attack.time = 1){
		a1 = 0;
	}
	if(attack.time mod 5 = 0){
		a = MakeEnemyBullet(x-145,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = -90-a1;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,3,120);
		a = MakeEnemyBullet(x+145,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = -90+a1;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,3,120);
	}
	if(attack.time = 20){
		Anim_Create(id,"a1",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,0,30,20);
		Anim_Create(id,"a1",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,30,-60,40,20);
		Anim_Create(id,"a1",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,-30,30,20,60);
	}
	if(attack.time = 120)attack.active = false;
}

function attack_3(attack){
	if(attack.time = 1){
		for(i=0;i<3;i+=1){
			a = MakeEnemyBullet(x,y+120,bullet_enemy_lightning_ball,-1);
			a.image_angle = 40;
			a.direction = a.image_angle-90;
			Anim_Create(a,"speed",0,0,15,-9+i*4,20);
			Anim_Create(a,"speed",0,0,6+i*4,20,60,20);
			Anim_Create(a,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,+40,-60+i*15,30,10);
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
	if(attack.time = 2)attack.active = false;
}

function attack_4(attack){
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
	if(attack.time = 2)attack.active = false;
}