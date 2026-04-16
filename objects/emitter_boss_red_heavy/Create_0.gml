live;
event_inherited();

function attack_0(){//散射+六向直线 240
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
	}
	if(attack_time mod 5 = 0&&attack_time < 180){
		a = MakeEnemyBullet(x,y+70,bullet_enemy_star,spr_bullet_enemy_normal_4);
		rdm = sin(attack_time*114)*40
		a.direction = -90 + rdm;
		a.speed = 4 + abs(rdm)/10;
		a.friction = -0.2;
		a.image_xscale = 0.5;
		a.image_yscale = 0.5;
		Anim_Create(a,"image_xscale",0,0,0.5,0.5,60);
		Anim_Create(a,"image_yscale",0,0,0.5,0.5,60);
	}
	if(attack_time = 180){
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
	if(attack_time = 180){
		end_attack();
		mark.SetMoveEnabled(true);
	}
}
	
function attack_1(){//散射 120
	at = attack_time;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		a3 = function(){
			for(i=0;i<4;i+=1){
				dir = [-90,-90];//[point_direction(x-75,y+100,player.x,player.y),point_direction(x+75,y+100,player.x,player.y)];
				for(j=0;j<3;j+=1){
					if(i = 0){
						a = MakeEnemyBullet(x-75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						a.image_angle = dir[0]-21+j*21;
						a.direction = dir[0]-21+j*21;
						Anim_Create(a,"speed",0,0,0,10,30);
						a = MakeEnemyBullet(x+75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						a.image_angle = dir[1]-21+j*21;
						a.direction = dir[1]-21+j*21;
						Anim_Create(a,"speed",0,0,0,10,30);
					}
					else{
						a = MakeEnemyBullet(x-75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						a.image_angle = dir[0]-i*3-21+j*21;
						a.direction = dir[0]-i*3-21+j*21;
						Anim_Create(a,"speed",0,0,0,10-i,30);
						a = MakeEnemyBullet(x-75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						a.image_angle = dir[0]+i*3-21+j*21;
						a.direction = dir[0]+i*3-21+j*21;
						Anim_Create(a,"speed",0,0,0,10-i,30);
						a = MakeEnemyBullet(x+75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						a.image_angle = dir[1]-i*3-21+j*21;
						a.direction = dir[1]-i*3-21+j*21;
						Anim_Create(a,"speed",0,0,0,10-i,30);
						a = MakeEnemyBullet(x+75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						a.image_angle = dir[1]+i*3-21+j*21;
						a.direction = dir[1]+i*3-21+j*21;
						Anim_Create(a,"speed",0,0,0,10-i,30);
					}
				}
			}
		}
		a2 = function(){
			for(i=0;i<4;i+=1){
				dir = [-90,-90];//[point_direction(x-75,y+100,player.x,player.y),point_direction(x+75,y+100,player.x,player.y)];
				for(j=0;j<2;j+=1){
					if(i = 0){
						a = MakeEnemyBullet(x-75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						a.image_angle = dir[0]-10.5+j*21;
						a.direction = dir[0]-10.5+j*21;
						Anim_Create(a,"speed",0,0,0,10,30);
						a = MakeEnemyBullet(x+75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						a.image_angle = dir[1]-10.5+j*21;
						a.direction = dir[1]-10.5+j*21;
						Anim_Create(a,"speed",0,0,0,10,30);
					}
					else{
						a = MakeEnemyBullet(x-75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						a.image_angle = dir[0]-i*3-10.5+j*21;
						a.direction = dir[0]-i*3-10.5+j*21;
						Anim_Create(a,"speed",0,0,0,10-i,30);
						a = MakeEnemyBullet(x-75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						a.image_angle = dir[0]+i*3-10.5+j*21;
						a.direction = dir[0]+i*3-10.5+j*21;
						Anim_Create(a,"speed",0,0,0,10-i,30);
						a = MakeEnemyBullet(x+75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						a.image_angle = dir[1]-i*3-10.5+j*21;
						a.direction = dir[1]-i*3-10.5+j*21;
						Anim_Create(a,"speed",0,0,0,10-i,30);
						a = MakeEnemyBullet(x+75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						a.image_angle = dir[1]+i*3-10.5+j*21;
						a.direction = dir[1]+i*3-10.5+j*21;
						Anim_Create(a,"speed",0,0,0,10-i,30);
					}
				}
			}
		}
		a1 = function(){
			for(i=0;i<4;i+=1){
				dir = [-90,-90];//[point_direction(x-75,y+100,player.x,player.y),point_direction(x+75,y+100,player.x,player.y)];
				if(i = 0){
					a = MakeEnemyBullet(x-75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
					a.image_angle = dir[0];
					a.direction = dir[0];
					Anim_Create(a,"speed",0,0,0,10,30);
					a = MakeEnemyBullet(x+75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
					a.image_angle = dir[1];
					a.direction = dir[1];
					Anim_Create(a,"speed",0,0,0,10,30);
				}
				else{
					a = MakeEnemyBullet(x-75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
					a.image_angle = dir[0]-i*3;
					a.direction = dir[0]-i*3;
					Anim_Create(a,"speed",0,0,0,10-i,30);
					a = MakeEnemyBullet(x-75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
					a.image_angle = dir[0]+i*3;
					a.direction = dir[0]+i*3;
					Anim_Create(a,"speed",0,0,0,10-i,30);
					a = MakeEnemyBullet(x+75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
					a.image_angle = dir[1]-i*3;
					a.direction = dir[1]-i*3;
					Anim_Create(a,"speed",0,0,0,10-i,30);
					a = MakeEnemyBullet(x+75,y+100,bullet_enemy_normal,spr_bullet_enemy_normal_1);
					a.image_angle = dir[1]+i*3;
					a.direction = dir[1]+i*3;
					Anim_Create(a,"speed",0,0,0,10-i,30);
				}
			}
		}
	}
	if(attack_time mod 20 = 0){
		mark.SetSequence(seq_enemy_boss_mini_0_attack_0);
		tt = attack_time div 20;
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
	if(attack_time = 110){
		end_attack();
		mark.SetMoveEnabled(true);
		mark.SetIdle();
	}
}

function attack_2(){//侧双斜散射 120
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		mark.SetSequence(seq_enemy_boss_mini_0_attack_1);
		for(i=0;i<15;i+=1){
			a = MakeEnemyBullet(x-125-20,y+80,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,-i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = i*30-90;
			Anim_Create(a,"speed",0,0,0,9-(i/2.5),40,60+i*2.5);
			
			a = MakeEnemyBullet(x-125+20,y+80,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,-i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = i*10-90;
			Anim_Create(a,"speed",0,0,0,11-(i/2.5),40,90+i*2.5);
			
			a = MakeEnemyBullet(x-125-20,y+80,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = i*20-90;
			Anim_Create(a,"speed",0,0,0,9-(i/2.5),40,60+i*2.5);
			
			a = MakeEnemyBullet(x-125+20,y+80,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = i*25-90;
			Anim_Create(a,"speed",0,0,0,11-(i/2.5),40,90+i*2.5);
		}
		for(i=0;i<15;i+=1){
			a = MakeEnemyBullet(x+125+20,y+80,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = -i*30-90;
			Anim_Create(a,"speed",0,0,0,9-(i/2.5),40,60+i*2.5);
			
			a = MakeEnemyBullet(x+125-20,y+80,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = -i*10-90;
			Anim_Create(a,"speed",0,0,0,11-(i/2.5),40,90+i*2.5);
			
			a = MakeEnemyBullet(x+125+20,y+80,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,-i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = -i*20-90;
			Anim_Create(a,"speed",0,0,0,9-(i/2.5),40,60+i*2.5);
			
			a = MakeEnemyBullet(x+125-20,y+80,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,-i*5,30+i);
			Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,40*i+20,30+i);
			a.direction = -i*25-90;
			Anim_Create(a,"speed",0,0,0,11-(i/2),40,90+i*2.5);
		}
	}
	if(attack_time = 90){
		end_attack();
		mark.SetMoveEnabled(true);
		mark.SetIdle();
	}
}

function attack_3(){//中心散射 230
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		mark.SetSequence(seq_enemy_boss_mini_0_uncover);
	}
	if(attack_time = 60){
		mark.SetSequence(seq_enemy_boss_mini_0_uncover_attack);
	}
	if(attack_time > 60&&attack_time < 110){
		if(attack_time mod 3 = 0){
			tt = (attack_time-60) div 3;
			for(i=0;i<6;i+=1){
				a = MakeEnemyBullet(x,y+25,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				a.image_xscale = 2;
				a.image_yscale = 2;
				ex = lengthdir_x(16-tt,i*(360/6)+tt*5)*25;
				ey = lengthdir_y(16-tt,i*(360/6)+tt*5)*25;
				Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,ex,30+i*2);
				Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,ey,30+i*2);
				a.direction = i*(360/6)+tt*5;
				Anim_Create(a,"speed",0,0,0,-12,40,90);
			}
		}
	}
	if(attack_time > 120&&attack_time < 154){
		if(attack_time mod 2 = 0){
			tt = (attack_time-120) div 2;
			for(i=0;i<7;i+=1){
				a = MakeEnemyBullet(x,y+25,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				a.image_xscale = 2;
				a.image_yscale = 2;
				ex = lengthdir_x(16-tt,-i*(360/7)+tt*5)*25;
				ey = lengthdir_y(16-tt,-i*(360/7)+tt*5)*25;
				Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,ex,30+i*2);
				Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,ey,30+i*2);
				a.direction = -i*(360/7)-tt*5;
				Anim_Create(a,"speed",0,0,0,-12,40,90);
			}
		}
	}
	if(attack_time > 160&&attack_time < 176){
		if(attack_time mod 1 = 0){
			tt = (attack_time-160) div 1;
			for(i=0;i<8;i+=1){
				a = MakeEnemyBullet(x,y+25,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				a.image_xscale = 2;
				a.image_yscale = 2;
				ex = lengthdir_x(16-tt,i*(360/8)+tt*5)*25;
				ey = lengthdir_y(16-tt,i*(360/8)+tt*5)*25;
				Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,ex,30+i*2);
				Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,ey,30+i*2);
				a.direction = i*45-tt*5;
				Anim_Create(a,"speed",0,0,0,-12,50,90);
			}
		}
	}
	if(attack_time > 180&&attack_time < 190){
		if(attack_time mod 1 = 0){
			tt = (attack_time-180) div 1;
			for(i=0;i<9;i+=1){
				a = MakeEnemyBullet(x,y+25,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				a.image_xscale = 2;
				a.image_yscale = 2;
				ex = lengthdir_x(16-tt,-i*(360/9)+tt*5)*25;
				ey = lengthdir_y(16-tt,-i*(360/9)+tt*5)*25;
				Anim_Create(a,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.x,ex,30+i*2);
				Anim_Create(a,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.y,ey,30+i*2);
				a.direction = -i*(360/9)-tt*5;
				Anim_Create(a,"speed",0,0,0,-12,60,90);
			}
		}
	}
	if(attack_time = 200){
		mark.SetSequence(seq_enemy_boss_mini_0_cover);
	}
	if(attack_time = 230){
		end_attack();
		mark.SetMoveEnabled(true);
	}
}

var a0 = create_attack(0, attack_0, 1,120);
var a1 = create_attack(1, attack_1, 1,40);
var a2 = create_attack(2, attack_2, 1,60);
var a3 = create_attack(3, attack_3, 1,70);

fixed_sequence = [a0, a1, a2,a3];
random_pool = [a0, a1, a2,a3]