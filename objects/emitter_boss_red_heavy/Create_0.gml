live;
event_inherited();

duration = -1
loop = false

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
	}
}

function attack_0(attack,exarg=0){//散射+六向直线 240
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
	}
	if(attack.time mod 5 = 0&&attack.time < 180){
		a = MakeEnemyBullet(x,y+70,bullet_enemy_star,spr_bullet_enemy_red_4);
		rdm = sin(attack.time*114)*40
		a.direction = -90 + rdm;
		a.speed = 4 + abs(rdm)/10;
		a.friction = -0.2;
		a.image_xscale = 0.5;
		a.image_yscale = 0.5;
		Anim_Create(a,"image_xscale",0,0,0.5,0.5,60);
		Anim_Create(a,"image_yscale",0,0,0.5,0.5,60);
	}
	if(attack.time = 180){
		with(bullet_enemy_star){
			Anim_Create(id,"speed",0,0,speed,-speed,60);
			Anim_Destroy(id,"image_xscale");
			Anim_Destroy(id,"image_yscale");
			Anim_Create(id,"bb",0,0,255,-255,30);
			time = 0;
			ll = 0;
			Anim_Create(id,"line_length",0,0,0,4000,60);
			auto_destroy = false;
			alarm[1] = -1;
			if!(point_in_rectangle(x,y,-30,-30,room_width+30,room_height+30)){
				instance_destroy();
			}
			custom_function = function(){
				time += 1.2;
				if(time > y/15+35&&ll = 0){
					laser();
					ll = 1;
					line_length = 0;
				}
			}
		}
	}
	if(attack.time = 180){
		attack.End();
		mark.SetMoveEnabled(true);
	}
}

function attack_1(attack,exarg=0){//散狙 120
	at = attack.time;
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
		a3 = function(){
			for(i=0;i<4;i+=1){
				dir = [point_direction(x-75,y+100,player.x,player.y),point_direction(x+75,y+100,player.x,player.y)];
				for(j=0;j<3;j+=1){
					if(i = 0){
						a = MakeEnemyBullet(x-75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
						a.image_angle = dir[0]-21+j*21;
						a.direction = dir[0]-21+j*21;
						Anim_Create(a,"speed",0,0,0,12,30);
						a = MakeEnemyBullet(x+75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
						a.image_angle = dir[1]-21+j*21;
						a.direction = dir[1]-21+j*21;
						Anim_Create(a,"speed",0,0,0,12,30);
					}
					else{
						a = MakeEnemyBullet(x-75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
						a.image_angle = dir[0]-i*3-21+j*21;
						a.direction = dir[0]-i*3-21+j*21;
						Anim_Create(a,"speed",0,0,0,12-i,30);
						a = MakeEnemyBullet(x-75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
						a.image_angle = dir[0]+i*3-21+j*21;
						a.direction = dir[0]+i*3-21+j*21;
						Anim_Create(a,"speed",0,0,0,12-i,30);
						a = MakeEnemyBullet(x+75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
						a.image_angle = dir[1]-i*3-21+j*21;
						a.direction = dir[1]-i*3-21+j*21;
						Anim_Create(a,"speed",0,0,0,12-i,30);
						a = MakeEnemyBullet(x+75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
						a.image_angle = dir[1]+i*3-21+j*21;
						a.direction = dir[1]+i*3-21+j*21;
						Anim_Create(a,"speed",0,0,0,12-i,30);
					}
				}
			}
		}
		a2 = function(){
			for(i=0;i<4;i+=1){
				dir = [point_direction(x-75,y+100,player.x,player.y),point_direction(x+75,y+100,player.x,player.y)];
				for(j=0;j<2;j+=1){
					if(i = 0){
						a = MakeEnemyBullet(x-75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
						a.image_angle = dir[0]-10.5+j*21;
						a.direction = dir[0]-10.5+j*21;
						Anim_Create(a,"speed",0,0,0,12,30);
						a = MakeEnemyBullet(x+75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
						a.image_angle = dir[1]-10.5+j*21;
						a.direction = dir[1]-10.5+j*21;
						Anim_Create(a,"speed",0,0,0,12,30);
					}
					else{
						a = MakeEnemyBullet(x-75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
						a.image_angle = dir[0]-i*3-10.5+j*21;
						a.direction = dir[0]-i*3-10.5+j*21;
						Anim_Create(a,"speed",0,0,0,12-i,30);
						a = MakeEnemyBullet(x-75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
						a.image_angle = dir[0]+i*3-10.5+j*21;
						a.direction = dir[0]+i*3-10.5+j*21;
						Anim_Create(a,"speed",0,0,0,12-i,30);
						a = MakeEnemyBullet(x+75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
						a.image_angle = dir[1]-i*3-10.5+j*21;
						a.direction = dir[1]-i*3-10.5+j*21;
						Anim_Create(a,"speed",0,0,0,12-i,30);
						a = MakeEnemyBullet(x+75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
						a.image_angle = dir[1]+i*3-10.5+j*21;
						a.direction = dir[1]+i*3-10.5+j*21;
						Anim_Create(a,"speed",0,0,0,12-i,30);
					}
				}
			}
		}
		a1 = function(){
			for(i=0;i<4;i+=1){
				dir = [point_direction(x-75,y+100,player.x,player.y),point_direction(x+75,y+100,player.x,player.y)];
				if(i = 0){
					a = MakeEnemyBullet(x-75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
					a.image_angle = dir[0];
					a.direction = dir[0];
					Anim_Create(a,"speed",0,0,0,12,30);
					a = MakeEnemyBullet(x+75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
					a.image_angle = dir[1];
					a.direction = dir[1];
					Anim_Create(a,"speed",0,0,0,12,30);
				}
				else{
					a = MakeEnemyBullet(x-75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
					a.image_angle = dir[0]-i*3;
					a.direction = dir[0]-i*3;
					Anim_Create(a,"speed",0,0,0,12-i,30);
					a = MakeEnemyBullet(x-75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
					a.image_angle = dir[0]+i*3;
					a.direction = dir[0]+i*3;
					Anim_Create(a,"speed",0,0,0,12-i,30);
					a = MakeEnemyBullet(x+75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
					a.image_angle = dir[1]-i*3;
					a.direction = dir[1]-i*3;
					Anim_Create(a,"speed",0,0,0,12-i,30);
					a = MakeEnemyBullet(x+75,y+100,bullet_enemy_red,spr_bullet_enemy_red_1);
					a.image_angle = dir[1]+i*3;
					a.direction = dir[1]+i*3;
					Anim_Create(a,"speed",0,0,0,12-i,30);
				}
			}
		}
	}
	if(attack.time mod 20 = 0){
		with(mark){
			layer_sequence_destroy(enemy_sequence);
			enemy_sequence = layer_sequence_create(le,x,y,seq_enemy_boss_mini_0_attack_0);
			layer_sequence_xscale(enemy_sequence,image_xscale);
			layer_sequence_yscale(enemy_sequence,image_yscale);
		}
		tt = attack.time div 20;
		switch(tt){
			case 1:
			case 5:
				a3();
				break;
			case 2:
			case 4:
				a2();
				break;
			case 3:
				a1();
				break;
		}
	}
	if(attack.time = 120){
		attack.End();
		mark.SetMoveEnabled(true);
		mark.SetState(ENEMY_STATE.IDLE);
	}
}

function attack_2(attack,exarg=0){//侧双斜散射 120
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
		with(mark){
			layer_sequence_destroy(enemy_sequence);
			enemy_sequence = layer_sequence_create(le,x,y,seq_enemy_boss_mini_0_attack_1);
			layer_sequence_xscale(enemy_sequence,image_xscale);
			layer_sequence_yscale(enemy_sequence,image_yscale);
		}
		for(i=0;i<15;i+=1){
			a = MakeEnemyBullet(x-125-20,y+80,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,-i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = i*30-90;
			Anim_Create(a,"speed",0,0,0,10,40,60+i*2);
			
			a = MakeEnemyBullet(x-125+20,y+80,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,-i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = i*10-90;
			Anim_Create(a,"speed",0,0,0,12,40,70+i*2);
			
			a = MakeEnemyBullet(x-125-20,y+80,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = i*20-90;
			Anim_Create(a,"speed",0,0,0,10,40,60+i*2);
			
			a = MakeEnemyBullet(x-125+20,y+80,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = i*25-90;
			Anim_Create(a,"speed",0,0,0,12,40,70+i*2);
		}
		for(i=0;i<15;i+=1){
			a = MakeEnemyBullet(x+125+20,y+80,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = -i*30-90;
			Anim_Create(a,"speed",0,0,0,10,40,60+i*2);
			
			a = MakeEnemyBullet(x+125-20,y+80,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = -i*10-90;
			Anim_Create(a,"speed",0,0,0,12,40,70+i*2);
			
			a = MakeEnemyBullet(x+125+20,y+80,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,-i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = -i*20-90;
			Anim_Create(a,"speed",0,0,0,10,40,60+i*2);
			
			a = MakeEnemyBullet(x+125-20,y+80,bullet_enemy_red,spr_bullet_enemy_red_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,-i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = -i*25-90;
			Anim_Create(a,"speed",0,0,0,12,40,70+i*2);
		}
	}
	if(time = 120){
		attack.End();
		mark.SetMoveEnabled(true);
		mark.SetState(ENEMY_STATE.IDLE);
	}
}

function attack_3(attack,exarg=0){//中心散射 230
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
		with(mark){
			layer_sequence_destroy(enemy_sequence);
			enemy_sequence = layer_sequence_create(le,x,y,seq_enemy_boss_mini_0_uncover);
			layer_sequence_xscale(enemy_sequence,image_xscale);
			layer_sequence_yscale(enemy_sequence,image_yscale);
		}
	}
	if(attack.time = 60){
		with(mark){
			layer_sequence_destroy(enemy_sequence);
			enemy_sequence = layer_sequence_create(le,x,y,seq_enemy_boss_mini_0_uncover_attack);
			layer_sequence_xscale(enemy_sequence,image_xscale);
			layer_sequence_yscale(enemy_sequence,image_yscale);
		}
	}
	if(attack.time > 60&&attack.time < 110){
		if(attack.time mod 3 = 0){
			tt = (attack.time-60) div 3;
			for(i=0;i<6;i+=1){
				a = MakeEnemyBullet(x,y+25,bullet_enemy_red,spr_bullet_enemy_red_0);
				a.image_xscale = 2;
				a.image_yscale = 2;
				ex = lengthdir_x(16-tt,i*(360/6)+tt*5)*25;
				ey = lengthdir_y(16-tt,i*(360/6)+tt*5)*25;
				Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,ex,30+i*2);
				Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,ey,30+i*2);
				a.direction = i*(360/6)+tt*5;
				Anim_Create(a,"speed",0,0,0,-15,40,90);
			}
		}
	}
	if(attack.time > 120&&attack.time < 154){
		if(attack.time mod 2 = 0){
			tt = (attack.time-120) div 2;
			for(i=0;i<7;i+=1){
				a = MakeEnemyBullet(x,y+25,bullet_enemy_red,spr_bullet_enemy_red_0);
				a.image_xscale = 2;
				a.image_yscale = 2;
				ex = lengthdir_x(16-tt,-i*(360/7)+tt*5)*25;
				ey = lengthdir_y(16-tt,-i*(360/7)+tt*5)*25;
				Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,ex,30+i*2);
				Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,ey,30+i*2);
				a.direction = -i*(360/7)-tt*5;
				Anim_Create(a,"speed",0,0,0,-15,40,90);
			}
		}
	}
	if(attack.time > 160&&attack.time < 176){
		if(attack.time mod 1 = 0){
			tt = (attack.time-160) div 1;
			for(i=0;i<8;i+=1){
				a = MakeEnemyBullet(x,y+25,bullet_enemy_red,spr_bullet_enemy_red_0);
				a.image_xscale = 2;
				a.image_yscale = 2;
				ex = lengthdir_x(16-tt,i*(360/8)+tt*5)*25;
				ey = lengthdir_y(16-tt,i*(360/8)+tt*5)*25;
				Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,ex,30+i*2);
				Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,ey,30+i*2);
				a.direction = i*45-tt*5;
				Anim_Create(a,"speed",0,0,0,-15,40,90);
			}
		}
	}
	if(attack.time > 180&&attack.time < 196){
		if(attack.time mod 1 = 0){
			tt = (attack.time-160) div 1;
			for(i=0;i<9;i+=1){
				a = MakeEnemyBullet(x,y+25,bullet_enemy_red,spr_bullet_enemy_red_0);
				a.image_xscale = 2;
				a.image_yscale = 2;
				ex = lengthdir_x(16-tt,-i*(360/9)+tt*5)*25;
				ey = lengthdir_y(16-tt,-i*(360/9)+tt*5)*25;
				Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,ex,30+i*2);
				Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,ey,30+i*2);
				a.direction = -i*(360/9)-tt*5;
				Anim_Create(a,"speed",0,0,0,-15,40,90);
			}
		}
	}
	if(attack.time = 200){
		with(mark){
			layer_sequence_destroy(enemy_sequence);
			enemy_sequence = layer_sequence_create(le,x,y,seq_enemy_boss_mini_0_cover);
			layer_sequence_xscale(enemy_sequence,image_xscale);
			layer_sequence_yscale(enemy_sequence,image_yscale);
		}
	}
	if(attack.time = 230){
		attack.End();
		mark.SetMoveEnabled(true);
	}
}