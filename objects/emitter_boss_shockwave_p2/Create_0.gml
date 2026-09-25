event_inherited();
	
attack_0 = function(){//圆环散射加对称波
	live_name = "emitter_boss_shockwave_p2:attack_0";
	live;
	if(attack_time = 1){
		MoveEnemy(false);
		we = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		we.scale = 0.5;
		we.duration = 90;
		we.vspeed = 4;
		Anim_Create(we,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,we.x,-we.x+50,30);
		Anim_Create(we,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN,50,room_width,60,30);
		Anim_Create(we,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,20);
		with(we){
			custom_function = function(){
				if(duration < 60&&duration mod 8 = 0){
					for(i=0;i<16;i+=1){
						blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						blt.direction = i*(360/16);
						blt.image_angle = blt.direction;
						blt.speed = 1;
						Anim_Create(blt,"speed",0,0,1,8+(i mod 2 = 0)*2,10,60);
					}
				}
			}
		}
	}
	if(attack_time = 60||attack_time = 85||attack_time = 110||attack_time = 135){
		wr = MakeEnemyBullet(x-200,y-140,bullet_enemy_wavering);
		wr.radius = 0;
		wr.radius_spd = 6;
		wr.hspeed = -2;
		wr.ring_width = 30;
		wr = MakeEnemyBullet(x+200,y-140,bullet_enemy_wavering);
		wr.radius = 0;
		wr.radius_spd = 6;
		wr.hspeed = 2;
		wr.ring_width = 30;
	}
	if(attack_time = 135){
		MoveEnemy(true);
	}
	if(attack_time = 160){
		MoveEnemy(false);
		we = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		we.scale = 0.5;
		we.duration = 90;
		we.vspeed = 4;
		Anim_Create(we,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,we.x,room_width-we.x-50,30);
		Anim_Create(we,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN,room_width-50,-room_width,60,30);
		Anim_Create(we,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,20);
		with(we){
			custom_function = function(){
				if(duration < 60&&duration mod 8 = 0){
					for(i=0;i<16;i+=1){
						blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						blt.direction = i*(360/16);
						blt.image_angle = blt.direction;
						blt.speed = 1;
						Anim_Create(blt,"speed",0,0,1,8+(i mod 2 = 0)*2,10,60);
					}
				}
			}
		}
	}
	if(attack_time = 220||attack_time = 245||attack_time = 270||attack_time = 295){
		wr = MakeEnemyBullet(x-200,y-140,bullet_enemy_wavering);
		wr.radius = 0;
		wr.radius_spd = 6;
		wr.hspeed = -2;
		wr.ring_width = 30;
		wr = MakeEnemyBullet(x+200,y-140,bullet_enemy_wavering);
		wr.radius = 0;
		wr.radius_spd = 6;
		wr.hspeed = 2;
		wr.ring_width = 30;
	}
	if(attack_time = 295){
		MoveEnemy(true);
	}
	if(attack_time = 360){
		MoveEnemy(false);
		we = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		we.scale = 0.5;
		we.duration = 90;
		we.vspeed = 4;
		Anim_Create(we,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,we.x,room_width-we.x-50,30);
		Anim_Create(we,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN,room_width-50,-room_width,60,30);
		Anim_Create(we,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,20);
		with(we){
			custom_function = function(){
				if(duration < 60&&duration mod 12 = 0){
					for(i=0;i<16;i+=1){
						blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						blt.direction = i*(360/16);
						blt.image_angle = blt.direction;
						blt.speed = 1;
						Anim_Create(blt,"speed",0,0,1,6+(i mod 2 = 0)*2,10,60);
					}
				}
			}
		}
		we = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		we.scale = 0.5;
		we.duration = 90;
		we.vspeed = 4;
		Anim_Create(we,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,we.x,-we.x+50,30);
		Anim_Create(we,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN,50,room_width,60,30);
		Anim_Create(we,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,20);
		with(we){
			custom_function = function(){
				if(duration < 60&&duration mod 12 = 0){
					for(i=0;i<16;i+=1){
						blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						blt.direction = i*(360/16);
						blt.image_angle = blt.direction;
						blt.speed = 1;
						Anim_Create(blt,"speed",0,0,1,6+(i mod 2 = 0)*2,10,60);
					}
				}
			}
		}
	}
	if(attack_time = 500||attack_time = 510||attack_time = 520||attack_time = 530){
		wr = MakeEnemyBullet(x-200,y-140,bullet_enemy_wavering);
		wr.radius = 0;
		wr.radius_spd = 15;
		wr.hspeed = -2;
		wr.ring_width = 20;
		wr = MakeEnemyBullet(x+200,y-140,bullet_enemy_wavering);
		wr.radius = 0;
		wr.radius_spd = 15;
		wr.hspeed = 2;
		wr.ring_width = 20;
	}
	if(attack_time = 580){
		MoveEnemy(true);
		end_attack();
	}
}
	
attack_1 = function(){//抛射子弹加中间波
	live_name = "emitter_boss_shockwave_p2:attack_1";
	live;
	if(attack_time mod 50 = 0&&attack_time < 400){
		wr = MakeEnemyBullet(x,y-75,bullet_enemy_wavering);
		wr.radius = 0;
		wr.radius_spd = 4;
	}
	if(attack_time mod 50 = 25&&attack_time < 400){
		wr = MakeEnemyBullet(x,y-75,bullet_enemy_wavering);
		wr.radius = 0;
		wr.radius_spd = 10;
	}
	if(attack_time mod 10 = 0&&attack_time < 500){
		blt = MakeEnemyBullet(x-123,y-163,bullet_enemy_normal);
		blt.hspeed = -abs(sin(attack_time*951753 mod 527 + 951)*3+4);
		blt.vspeed = -4;
		blt.gravity = abs(sin(attack_time*852+645)*0.1+0.2);
		with(blt){
			bounced = 0;
			custom_function = function(){
				if(x <= 0&&bounced = 0){
					bounced = 1;
					hspeed *= -1;
					x = abs(x);
				}
				if(vspeed > 10)vspeed = 2;
			}
		}
		blt = MakeEnemyBullet(x+123,y-163,bullet_enemy_normal);
		blt.hspeed = abs(sin(attack_time*451753 mod 527 + 951)*3+4);
		blt.vspeed = -4;
		blt.gravity = abs(sin(attack_time*352+645)*0.1+0.2);
		with(blt){
			bounced = 0;
			custom_function = function(){
				if(x >= room_width&&bounced = 0){
					bounced = 1;
					hspeed *= -1;
					x = room_width*2-x;
				}
				if(vspeed > 10)vspeed = 2;
			}
		}
	}
	if(attack_time = 580){
		end_attack();
	}
}
	
attack_2 = function(){//椭圆散射反弹落
	live_name = "emitter_boss_shockwave_p2:attack_2";
	live;
	if(attack_time mod 20 = 1&&attack_time < 100){
		for(i=0;i<10;i+=1){
			blt = MakeEnemyBullet(x,y-75,bullet_enemy_normal);
			blt.direction = 36*i;
			blt.hspeed = lengthdir_x(12,36*i);
			blt.vspeed = lengthdir_y(3,36*i);
			with(blt){
				bounced = 0;
				custom_function = function(){
					if(x <= 0&&bounced = 0){
						bounced = 1;
						hspeed *= -1;
						x = abs(x);
					}
					if(x >= room_width&&bounced = 0){
						bounced = 1;
						hspeed *= -1;
						x = room_width*2-x;
					}
				}
			}
			ff = function(){
				image_index = 1;
				hspeed = 0;
				vspeed = 0;
				gravity = 0.5;
				Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,2,20);
				Anim_Create(id,"hspeed",0,0,0,(Player_GetPos()[0]-x)/100,60);
			}
			Anim_Create(blt,"speed",0,0,blt.speed,-blt.speed+1,30,60+sin(attack_time*82+456*i+attack_time*753)*20,ff);
		}
	}
	if(attack_time = 220){
		end_attack();
	}
}
	
attack_3 = function(){//追踪波加散射
	live_name = "emitter_boss_shockwave_p2:attack_3";
	live;
	if(attack_time = 1){
		we0 = MakeEnemyBullet(x-125,y-110,bullet_enemy_wavering_emitter);
		we0.scale = 0.5;
		we0.inv_block = true;
		Anim_Create(we0,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,20);
		Anim_Create(we0,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,we0.x,max(100,we0.x-100)-we0.x,30);
		Anim_Create(we0,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,we0.y,max(100,we0.y-100)-we0.y,30);
		with(we0){
			tt = 40;
			custom_function = function(){
				if(tt = 0){
					tt = 90;
					xx = Player_GetPos()[0];
					yy = Player_GetPos()[1];
					Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,x,xx-x,50);
					Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,y,yy-y,50);
				}
				if(tt = 40){
					wr = MakeEnemyBullet(x,y,bullet_enemy_wavering);
					wr.radius = 0;
					wr.radius_spd = 1;
					Anim_Create(wr,"radius_spd",0,0,1,3,20,30);
					for(i=0;i<12;i+=1){
						blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_2);
						blt.image_index = 0;
						blt.direction = point_direction(x,y,Player_GetPos()[0],Player_GetPos()[1])+i*30;
						blt.speed = 7;
						blt.image_angle = blt.direction;
					}
				}
				tt -= 1;
			}
		}
	}
	if(attack_time = 45){
		we1 = MakeEnemyBullet(x+125,y-110,bullet_enemy_wavering_emitter);
		we1.scale = 0.5;
		we1.inv_block = true;
		Anim_Create(we1,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,20);
		Anim_Create(we1,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,we1.x,max(room_width-100,we1.x+100)-we1.x,30);
		Anim_Create(we1,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,we1.y,max(100,we1.y-100)-we1.y,30);
		with(we1){
			tt = 40;
			custom_function = function(){
				if(tt = 0){
					tt = 90;
					xx = Player_GetPos()[0];
					yy = Player_GetPos()[1];
					Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,x,xx-x,50);
					Anim_Create(id,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,y,yy-y,50);
				}
				if(tt = 40){
					wr = MakeEnemyBullet(x,y,bullet_enemy_wavering);
					wr.radius = 0;
					wr.radius_spd = 1;
					Anim_Create(wr,"radius_spd",0,0,1,3,20,30);
					for(i=0;i<12;i+=1){
						blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_2);
						blt.image_index = 1;
						blt.direction = point_direction(x,y,Player_GetPos()[0],Player_GetPos()[1])+i*30;
						blt.speed = 7;
						blt.image_angle = blt.direction;
					}
				}
				tt -= 1;
			}
		}
	}
	if(attack_time = 600){
		with(we0)custom_function = function(){};
		with(we1)custom_function = function(){};
		Anim_Destroy(we0);
		Anim_Destroy(we1);
	}
	if(attack_time = 630){
		we0.gravity = 0.3;
		we0.hspeed = 2;
		we0.vspeed = -5;
		we1.gravity = 0.3;
		we1.hspeed = -2;
		we1.vspeed = -5;
	}
	if(attack_time = 700){
		end_attack();
	}
}
	
attack_4 = function(c=0){//四连波
	live_name = "emitter_boss_shockwave_p2:attack_4";
	live;
	if(attack_time = 1){
		if(c = 0)wo = [660,0,400,room_height,room_width,580,0,320];
		if(c = 1)wo = [0,780,room_width,room_height,470,0,200,room_height];
		if(c = 2)wo = [room_width,1050,160,0,0,1060,room_width,250];
		we = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		we.scale = 0.5;
		Anim_Create(we,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,60);
		Anim_Create(we,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN,we.x,wo[0]-we.x,60);
		Anim_Create(we,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN,we.y,wo[1]-we.y,60);
		Anim_Create(we,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1,-1,60,60);
		we.duration = 120;
	}
	if(attack_time = 20){
		we = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		we.scale = 0.5;
		Anim_Create(we,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,60);
		Anim_Create(we,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN,we.x,wo[2]-we.x,60);
		Anim_Create(we,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN,we.y,wo[3]-we.y,60);
		Anim_Create(we,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1,-1,60,60);
		we.duration = 120;
	}
	if(attack_time = 40){
		we = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		we.scale = 0.5;
		Anim_Create(we,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,60);
		Anim_Create(we,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN,we.x,wo[4]-we.x,60);
		Anim_Create(we,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN,we.y,wo[5]-we.y,60);
		Anim_Create(we,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1,-1,60,60);
		we.duration = 120;
	}
	if(attack_time = 60){
		we = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		we.scale = 0.5;
		Anim_Create(we,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,60);
		Anim_Create(we,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN,we.x,wo[6]-we.x,60);
		Anim_Create(we,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN,we.y,wo[7]-we.y,60);
		Anim_Create(we,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.IN,1,-1,60,60);
		we.duration = 120;
		for(i=0;i<4;i+=1){
			wr = MakeEnemyBullet(wo[0],wo[1],bullet_enemy_wavering);
			wr.radius = 0;
			wr.ring_width = 30;
			Anim_Create(wr,"radius",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,40+i*100,30);
			Anim_Create(wr,"radius_spd",0,0,0,12,60,120-attack_time);
		}
	}
	if(attack_time = 80){
		for(i=0;i<4;i+=1){
			wr = MakeEnemyBullet(wo[2],wo[3],bullet_enemy_wavering);
			wr.radius = 0;
			wr.ring_width = 30;
			Anim_Create(wr,"radius",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,40+i*100,30);
			Anim_Create(wr,"radius_spd",0,0,0,12,60,120-attack_time);
		}
	}
	if(attack_time = 100){
		for(i=0;i<4;i+=1){
			wr = MakeEnemyBullet(wo[4],wo[5],bullet_enemy_wavering);
			wr.radius = 0;
			wr.ring_width = 30;
			Anim_Create(wr,"radius",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,40+i*100,30);
			Anim_Create(wr,"radius_spd",0,0,0,12,60,120-attack_time);
		}
	}
	if(attack_time = 120){
		for(i=0;i<4;i+=1){
			wr = MakeEnemyBullet(wo[6],wo[7],bullet_enemy_wavering);
			wr.radius = 0;
			wr.ring_width = 30;
			Anim_Create(wr,"radius",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,40+i*100,30);
			Anim_Create(wr,"radius_spd",0,0,0,12,60,120-attack_time);
		}
	}
	if(attack_time = 210){
		end_attack();
	}
}
	
attack_5 = function(dir=0){//旋转四五散射
	live_name = "emitter_boss_shockwave_p2:attack_5";
	live;
	if(attack_time = 1){
		dd0 = 0;
		rr0 = -90;
		Anim_Create(id,"dd0",0,0,0,100,60);
		Anim_Create(id,"rr0",ANIM_TWEEN.QUAD,ANIM_EASE.IN,-90,720*(dir=0 ? 1 : -1),60);
	}
	if(attack_time < 60){
		for(i=0;i<4;i+=1){
			blt = MakeEnemyBullet(x+lengthdir_x(dd0,rr0),y-75+lengthdir_y(dd0,rr0),bullet_enemy_normal);
			blt.direction = rr0+90*i+attack_time*5;
			blt.speed = 1;
			Anim_Create(blt,"speed",0,0,blt.speed,12,5,60);
			Anim_Create(blt,"direction",0,0,blt.direction,90,180);
		}
	}
	if(attack_time = 30){
		dd1 = 0;
		rr1 = -90;
		Anim_Create(id,"dd1",0,0,0,100,60);
		Anim_Create(id,"rr1",ANIM_TWEEN.QUAD,ANIM_EASE.IN,-90,-720*(dir=0 ? 1 : -1),60);
	}
	if(attack_time>30&&attack_time < 90&&attack_time mod 2 = 0){
		for(i=0;i<5;i+=1){
			blt = MakeEnemyBullet(x+lengthdir_x(dd1,rr1),y-75+lengthdir_y(dd1,rr1),bullet_enemy_normal);
			blt.image_index = 2;
			blt.direction = rr1+72*i-attack_time*5;
			blt.speed = 1;
			Anim_Create(blt,"speed",0,0,blt.speed,12,5,60);
			Anim_Create(blt,"direction",0,0,blt.direction,-90,180);
		}
	}
	if(attack_time = 180){
		end_attack();
	}
}
	
attack_6 = function(){//底波加随机子弹链
	live_name = "emitter_boss_shockwave_p2:attack_6";
	live;
	if(attack_time = 1){
		MoveEnemy(false);
		Anim_Create(mark,"x",0,0,mark.x,room_width/2-mark.x,30);
		Anim_Create(mark,"y",0,0,mark.y,room_width/2-mark.y,30);
	}
	if(attack_time > 30&&attack_time < 600){
		if(attack_time mod 30 = 0){
			wr = MakeEnemyBullet(0,room_height,bullet_enemy_wavering);
			wr.radius = 0;
			wr.radius_spd = 5;
			wr.ring_width = 30;
			wr = MakeEnemyBullet(room_width,room_height,bullet_enemy_wavering);
			wr.radius = 0;
			wr.radius_spd = 5;
			wr.ring_width = 30;
		}
		if(attack_time mod 10 = 0){
			rr = 200;
			for(i=0;i<1;i+=1){
				dd = -90 + sin(attack_time*25681+3859+i*241)*60;
				for(j=0;j<10;j+=1){
					blt = MakeEnemyBullet(x+lengthdir_x(rr,dd),y+lengthdir_y(rr,dd),bullet_enemy_normal,spr_bullet_enemy_normal_1);
					blt.direction = dd;
					blt.image_angle = dd;
					blt.speed = 0;
					Anim_Create(blt,"speed",0,0,0,10+(10-j),30,j*2+30);
					blt.image_xscale = 0;
					blt.image_yscale = 0;
					Anim_Create(blt,"image_xscale",0,0,0,1,30);
					Anim_Create(blt,"image_yscale",0,0,0,2,30);
					Anim_Create(blt,"direction",0,0,blt.direction,sin(attack_time*251+3859+i*241)*60,60,30+j*2);
					Anim_Create(blt,"image_angle",0,0,blt.image_angle,sin(attack_time*251+3859+i*241)*60,60,30+j*2);
				}
			}
		}
	}
	if(attack_time = 600){
		MoveEnemy(true);
	}
	if(attack_time = 720){
		end_attack();
	}
}

a0 = create_attack(0,attack_0,30);
a1 = create_attack(1,attack_1,30);
a2 = create_attack(2,attack_2,30);
a3 = create_attack(3,attack_3,30);
a4 = create_attack(4,attack_4,30);
a5 = create_attack(5,attack_5,30);
a6 = create_attack(6,attack_6,30);
a4b = create_attack(7,attack_4,30,,1);
a4c = create_attack(8,attack_4,30,,2);
a5b = create_attack(9,attack_5,30,,1);

fixed_sequence = [a0,a1,a2,a3,a4,a5,a6,a4c];
random_pool = [a0,a1,a2,a3,a4,a5,a6,a4b,a4c,a5b]

since_a6 = 5;

_end_attack_orig = end_attack;
end_attack = function(){
	if(mark.GetFrozen() > 0){
		if(current_attack = a3){
			if(instance_exists(we0)){
				with(we0)custom_function = function(){};
				Anim_Destroy(we0);
				we0.gravity = 0.3;
				we0.hspeed = 2;
				we0.vspeed = -5;
			}
			if(instance_exists(we1)){
				with(we1)custom_function = function(){};
				Anim_Destroy(we1);
				we1.gravity = 0.3;
				we1.hspeed = -2;
				we1.vspeed = -5;
			}
		}
	}
	if(current_attack != undefined){
		if(current_attack.id_num = 6){
			since_a6 = 0;
		}
		else{
			since_a6 += 1;
		}
	}
	_end_attack_orig();
}

_get_next_attack_orig = get_next_attack;
get_next_attack = function(){
	if(since_a6 < 5){
		var _sp = random_pool, _sf = fixed_sequence;
		var _np = [], _nf = [];
		for(var _i = 0; _i < array_length(_sp); _i += 1){
			if(_sp[_i].id_num != 6)array_push(_np,_sp[_i]);
		}
		for(var _i = 0; _i < array_length(_sf); _i += 1){
			if(_sf[_i].id_num != 6)array_push(_nf,_sf[_i]);
		}
		random_pool = _np;
		fixed_sequence = _nf;
		_get_next_attack_orig();
		random_pool = _sp;
		fixed_sequence = _sf;
	}
	else{
		_get_next_attack_orig();
	}
}