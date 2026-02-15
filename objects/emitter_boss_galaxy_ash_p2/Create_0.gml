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
last_attack = -1

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
	}
}

function attack_0(attack,exarg=0){//中4散弹 60
	if(attack.time = 1){
		for(i=0;i<6;i+=1){
			a = MakeEnemyBullet(x,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90-30-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
			a = MakeEnemyBullet(x,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90-50-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
			a = MakeEnemyBullet(x,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90+30+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
			a = MakeEnemyBullet(x,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90+50+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
		}
	}
	if(attack.time = 20){
		for(i=0;i<6;i+=1){
			a = MakeEnemyBullet(x,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
			a = MakeEnemyBullet(x,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90-20-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
			a = MakeEnemyBullet(x,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
			a = MakeEnemyBullet(x,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90+20+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
		}
	}
	if(attack.time = 40){
		for(i=0;i<6;i+=1){
			a = MakeEnemyBullet(x,y+140,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
			a = MakeEnemyBullet(x,y+140,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90-20+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
			a = MakeEnemyBullet(x,y+140,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
			a = MakeEnemyBullet(x,y+140,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90+20-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+(6-i)*3,50);
		}
	}
	if(attack.time = 60){
		for(i=0;i<6;i+=1){
			a = MakeEnemyBullet(x,y+140,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90-30+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
			a = MakeEnemyBullet(x,y+140,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90-50+i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
			a = MakeEnemyBullet(x,y+140,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90+30-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
			a = MakeEnemyBullet(x,y+140,bullet_enemy_red,spr_bullet_enemy_red_2);
			a.image_angle = -90+50-i*5;
			a.direction = a.image_angle;
			Anim_Create(a,"speed",0,0,0,12+i*3,50);
		}
	}
	if(attack.time = 60)attack.End();
}

function attack_1(attack,exarg=0){//中3散弹 150
	if(attack.time mod 3 = 0){
		tt = attack.time div 3;
		a = MakeEnemyBullet(x,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = -90-45+sin(tt/2)*20;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,3,10,50);
		a = MakeEnemyBullet(x,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = -90+45+sin(tt/2)*20;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,3,10,50);
		a = MakeEnemyBullet(x,y+160,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = -90+sin(tt/2)*20;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,3,10,50);
	}
	if(attack.time = 150)attack.End();
}
	
function attack_2(attack,exarg=0){//机枪 60
	if(attack.time = 1){
		with(mark){
			layer_sequence_destroy(enemy_sequence);
			enemy_sequence = layer_sequence_create(layer_enemy,x,y,seq_enemy_boss_large_1_p2_attack_0);
			layer_sequence_xscale(enemy_sequence,image_xscale);
			layer_sequence_yscale(enemy_sequence,image_yscale);
		}
	}
	if(attack.time mod 3 = 0){
		tt = attack.time div 3;
		if(tt mod 2 = 0){
			for(i=0;i<5;i+=1){
				a = MakeEnemyBullet(x-147,y+117,bullet_enemy_red,spr_bullet_enemy_red_3);
				a.rotate = 3;
				a.direction = -90-50+i*20;
				Anim_Create(a,"speed",0,0,5,8,30);
				a = MakeEnemyBullet(x+147,y+117,bullet_enemy_red,spr_bullet_enemy_red_3);
				a.rotate = -3;
				a.direction = -90-50+i*20;
				Anim_Create(a,"speed",0,0,5,8,30);
			}
		}
		else{
			for(i=0;i<4;i+=1){
				a = MakeEnemyBullet(x-147,y+117,bullet_enemy_red,spr_bullet_enemy_red_3);
				a.rotate = 3;
				a.direction = -90-40+i*20;
				Anim_Create(a,"speed",0,0,5,8,30);
				a = MakeEnemyBullet(x+147,y+117,bullet_enemy_red,spr_bullet_enemy_red_3);
				a.rotate = -3;
				a.direction = -90-40+i*20;
				Anim_Create(a,"speed",0,0,5,8,30);
			}
		}
	}
	if(attack.time = 59){
		mark.SetState(ENEMY_STATE.IDLE);
	}
	if(attack.time = 60)attack.End();
}
	
function attack_3(attack,exarg=0){//长侧封位弹（触侧反弹） 180+exarg
	if(attack.time mod 5 = 0){
		a = MakeEnemyBullet(x-220,y+200,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = -90;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x+220,y+200,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = -90;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x-220,y+200,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = -90+45;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x-220,y+200,bullet_enemy_red,spr_bullet_enemy_red_2);
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
		a = MakeEnemyBullet(x+220,y+200,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = -90-45;
		a.direction = a.image_angle;
		Anim_Create(a,"speed",0,0,10,6,30);
		a = MakeEnemyBullet(x+220,y+200,bullet_enemy_red,spr_bullet_enemy_red_2);
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
	
function attack_4(attack,exarg=0){//侧狙 40
	if(attack.time = 1){
		dir0 = point_direction(x-220,y+200,player.x,player.y);
		dir1 = point_direction(x+220,y+200,player.x,player.y);
		with(mark){
			move_enabled = !move_enabled;
			if(move_enabled = true){
				move_nexttime = time;
				move_state = 0;
			}
			else{
				Anim_Destroy(id);
			}
		}
	}
	if(attack.time mod 4 = 0){
		a = MakeEnemyBullet(x-220,y+200,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = dir0+30;
		a.direction = a.image_angle;
		a.speed = 12;
		for(i=0;i<10;i+=1){
			Anim_Create(a,"direction",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.direction,-60,20,i*40);
			Anim_Create(a,"direction",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.direction-60,60,20,20+i*40);
			Anim_Create(a,"image_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.image_angle,-60,20,i*40);
			Anim_Create(a,"image_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.image_angle-60,60,20,20+i*40);
		}
		a = MakeEnemyBullet(x-220,y+200,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = dir0-30;
		a.direction = a.image_angle;
		a.speed = 12;
		for(i=0;i<10;i+=1){
			Anim_Create(a,"direction",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.direction,60,20,i*40);
			Anim_Create(a,"direction",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.direction+60,-60,20,20+i*40);
			Anim_Create(a,"image_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.image_angle,60,20,i*40);
			Anim_Create(a,"image_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.image_angle+60,-60,20,20+i*40);
		}
		a = MakeEnemyBullet(x+220,y+200,bullet_enemy_red,spr_bullet_enemy_red_2);
		a.image_angle = dir1-30;
		a.direction = a.image_angle;
		a.speed = 12;
		for(i=0;i<10;i+=1){
			Anim_Create(a,"direction",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.direction,60,20,i*40);
			Anim_Create(a,"direction",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.direction+60,-60,20,20+i*40);
			Anim_Create(a,"image_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.image_angle,60,20,i*40);
			Anim_Create(a,"image_angle",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,a.image_angle+60,-60,20,20+i*40);
		}
		a = MakeEnemyBullet(x+220,y+200,bullet_enemy_red,spr_bullet_enemy_red_2);
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
	if(attack.time = 40){
		attack.End();
		with(mark){
			move_enabled = !move_enabled;
			if(move_enabled = true){
				move_nexttime = time;
				move_state = 0;
			}
			else{
				Anim_Destroy(id);
			}
		}
	}
}
