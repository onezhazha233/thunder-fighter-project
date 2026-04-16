live;
event_inherited();

function attack_empty_30(){//30帧前摇
	if(attack_time = 30){
		end_attack();
	}
}

function attack_0(){//短散弹 60
	if(attack_time < 30){
		if(attack_time mod 5 = 0){
			tt = (attack_time div 5);
			if(tt = 0){
				for(i=0;i<6;i+=1){
					a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
					a.image_angle = -90;
					a.direction = a.image_angle;
					Anim_Create(a,"speed",0,0,0,15+i*2,50);
				}
			}
			else{
				for(i=0;i<6;i+=1){
					a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
					a.image_angle = -90+tt*15;
					a.direction = a.image_angle;
					Anim_Create(a,"speed",0,0,0,15+i*2,50);
					a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
					a.image_angle = -90-tt*15;
					a.direction = a.image_angle;
					Anim_Create(a,"speed",0,0,0,15+i*2,50);
				}
			}
		}
	}
	else{
		if(attack_time mod 5 = 0){
			tt = (attack_time div 5)-4;
			if(tt = 6){
				for(i=0;i<12;i+=1){
					a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
					a.image_angle = -90;
					a.direction = a.image_angle;
					Anim_Create(a,"speed",0,0,0,20+i*3,50);
				}
			}
			else{
				for(i=0;i<6;i+=1){
					a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
					a.image_angle = -90+(6-tt)*20-(tt mod 2)*3;
					a.direction = a.image_angle;
					Anim_Create(a,"speed",0,0,0,20+i*3,50);
					a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
					a.image_angle = -90-(6-tt)*20+(tt mod 2)*3;
					a.direction = a.image_angle;
					Anim_Create(a,"speed",0,0,0,20+i*3,50);
				}
			}
		}
	}
	if(attack_time = 60){
		end_attack();
	}
}
	
function attack_1(){//长中散弹 150
	if(attack_time = 1){
		num0 = 3;
		angle_range = 90;
	}
	if(attack_time mod 4 = 0){
		for(i=0;i<num0;i+=1){
			a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90-angle_range/2+i*angle_range/(num0-1);
			a.direction = a.image_angle;
			a.speed = 15;
		}
	}
	if(attack_time = 30){
		num0 = 4;
		angle_range = 120;
	}
	if(attack_time = 60){
		num0 = 5;
		angle_range = 150;
	}
	if(attack_time = 90){
		num0 = 4;
		angle_range = 120;
	}
	if(attack_time = 120){
		num0 = 3;
		angle_range = 90;
	}
	if(attack_time = 150){
		end_attack();
	}
}
	
function attack_2(){//两侧封位弹 120
	if(attack_time = 1){
		a1 = 0;
	}
	if(attack_time mod 5 = 0){
		a = MakeEnemyBullet(x-145,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = -90-a1;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x+145,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = -90+a1;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
	}
	if(attack_time = 20){
		Anim_Create(id,"a1",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,0,30,20);
		Anim_Create(id,"a1",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,30,-60,40,20);
		Anim_Create(id,"a1",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,-30,30,20,60);
	}
	if(attack_time = 120){
		end_attack();
	}
}
	
function attack_3(){//侧闪电球+中闪电球（触底反弹散射） 160
	if(attack_time = 1){
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
	if(attack_time = 60){
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
						a.mark = other.mark;
					}
				}
			}
		}
		end_attack();
	}
}
	
function attack_4(exarg=0){//长侧封位弹（触侧反弹） 180+exarg
	if(attack_time mod 5 = 0){
		a = MakeEnemyBullet(x-145,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = -90;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x+145,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = -90;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x-145,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
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
		a = MakeEnemyBullet(x+145,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
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
	if(attack_time = 180+exarg){
		end_attack();
	}
}
	
function attack_41(){
	if(attack_time mod 5 = 0&&attack_time < 220){
		a = MakeEnemyBullet(x-145,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = -90;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x+145,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
		a.image_angle = -90;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x-145,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
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
		a = MakeEnemyBullet(x+145,y+160,bullet_enemy_normal,spr_bullet_enemy_normal_2);
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
	if(attack_time = 1){
		num0 = 3;
		angle_range = 90;
	}
	if(attack_time mod 4 = 0&&attack_time > 50&&attack_time < 200){
		for(i=0;i<num0;i+=1){
			a = MakeEnemyBullet(x,y+140,bullet_enemy_normal,spr_bullet_enemy_normal_2);
			a.image_angle = -90-angle_range/2+i*angle_range/(num0-1);
			a.direction = a.image_angle;
			a.speed = 15;
		}
	}
	if(attack_time = 80){
		num0 = 4;
		angle_range = 120;
	}
	if(attack_time = 110){
		num0 = 5;
		angle_range = 150;
	}
	if(attack_time = 140){
		num0 = 4;
		angle_range = 120;
	}
	if(attack_time = 170){
		num0 = 3;
		angle_range = 90;
	}
	if(attack_time = 220){
		end_attack();
	}
}

var ae = create_attack(999, attack_empty_30);
var a0 = create_attack(0, attack_0,30);
var a1 = create_attack(1, attack_1,30);
var a2 = create_attack(2, attack_2,10);
var a3 = create_attack(3, attack_3,100);
var a4 = create_attack(4, attack_4,20);
var a4_long = create_attack(4, attack_4,20,1,40);
var a41 = create_attack(5, attack_41,20);

fixed_sequence = [ae,a0,a1,a2,a2,a3,a0,a4,a4_long,a1,a3];
random_pool = [a0,a1,a2,a3,a4,a41]