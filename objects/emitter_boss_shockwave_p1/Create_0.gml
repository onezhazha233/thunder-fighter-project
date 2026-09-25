event_inherited();
	
attack_0 = function(){//扫射激光加拐弯子弹
	live_name = "emitter_boss_shockwave_p1:attack_0";
	live;
	if(attack_time = 1){
		MoveEnemy(false);
		ll = MakeEnemyLaser(1,x-80,y+100,1,,45,75);
		rl = MakeEnemyLaser(1,x+80,y+100,1,,45,75);
		langle = 0;
		Anim_Create(id,"langle",0,0,0,90,40,90);
	}
	if(attack_time > 1&&attack_time < 165){
		if(instance_exists(ll))ll.image_angle = -90-langle;
		if(instance_exists(rl))rl.image_angle = -90+langle;
	}
	if(attack_time >= 90&&attack_time <= 125){
		if(attack_time mod 5 = 0){
			tt = (attack_time-95) div 5;
			for(i=0;i<15;i+=1){
				aa = -90-langle;
				if(instance_exists(ll)&&ll.length >= 60+100*i){
					blt = MakeEnemyBullet(x-80+lengthdir_x(60+100*i,aa),y+100+lengthdir_y(60+100*i,aa),bullet_enemy_normal,spr_bullet_enemy_normal_2);
					blt.image_angle = aa;
					blt.direction = blt.image_angle;
					if(i mod 2 = 0)blt.image_index = 1;
					Anim_Create(blt,"direction",0,0,blt.direction,180,180,40);
					Anim_Create(blt,"image_angle",0,0,blt.image_angle,180,180,40);
					Anim_Create(blt,"speed",0,0,0,30,90,40);
				}
				aa = -90+langle;
				if(instance_exists(rl)&&rl.length >= 60+100*i){
					blt = MakeEnemyBullet(x+80+lengthdir_x(60+100*i,aa),y+100+lengthdir_y(60+100*i,aa),bullet_enemy_normal,spr_bullet_enemy_normal_2);
					blt.image_angle = aa;
					blt.direction = blt.image_angle;
					if(i mod 2 = 0)blt.image_index = 1;
					Anim_Create(blt,"direction",0,0,blt.direction,-180,180,40);
					Anim_Create(blt,"image_angle",0,0,blt.image_angle,-180,180,40);
					Anim_Create(blt,"speed",0,0,0,30,90,40);
				}
			}
		}
	}
	if(attack_time = 230){
		MoveEnemy(true);
		end_attack();
	}
}
	
attack_1 = function(){//波加狙
	live_name = "emitter_boss_shockwave_p1:attack_1";
	live;
	if(attack_time = 1){
		lwe = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		lwe.inv_block = true;                          // 后续帧仍会引用它, 免疫守卫/护盾清除
		lwe.image_alpha = 0;
		lwe.scale = 0.5;
		Anim_Create(lwe,"image_alpha",0,0,0,1,30);
		Anim_Create(lwe,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,30);
		Anim_Create(lwe,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,lwe.x,-200,30);
		rwe = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		rwe.inv_block = true;                          // 后续帧仍会引用它, 免疫守卫/护盾清除
		rwe.image_alpha = 0;
		rwe.scale = 0.5;
		Anim_Create(rwe,"image_alpha",0,0,0,1,30);
		Anim_Create(rwe,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,30);
		Anim_Create(rwe,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,rwe.x,200,30);
		bb = 0;
	}
	if(attack_time < 120){
		if(attack_time mod 20 = 0){
			a = MakeEnemyBullet(lwe.x,lwe.y,bullet_enemy_wavering);
			a.radius = 0;
			Anim_Create(a,"radius_spd",0,0,4,4,60);
			a = MakeEnemyBullet(rwe.x,rwe.y,bullet_enemy_wavering);
			a.radius = 0;
			Anim_Create(a,"radius_spd",0,0,4,4,60);
		}
		if(attack_time mod 35 = 0){
			pp = Player_GetPos();
			dd0 = point_direction(lwe.x,lwe.y,pp[0],pp[1]);
			dd1 = point_direction(rwe.x,rwe.y,pp[0],pp[1]);
			if(bb = 0){
				for(i=0;i<3;i+=1){
					for(j=0;j<6;j+=1){
						blt = MakeEnemyBullet(lwe.x,lwe.y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						blt.direction = dd0-20+i*20;
						blt.image_angle = blt.direction;
						blt.speed = -7-j*0.5;
						blt.depth -= 2;
						Anim_Create(blt,"speed",0,0,blt.speed,20,60);
						blt = MakeEnemyBullet(rwe.x,rwe.y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						blt.direction = dd1-20+i*20;
						blt.image_angle = blt.direction;
						blt.speed = -7-j*0.5;
						blt.depth -= 2;
						Anim_Create(blt,"speed",0,0,blt.speed,20,60);
					}
				}
			}
			else{
				for(i=0;i<4;i+=1){
					for(j=0;j<5;j+=1){
						blt = MakeEnemyBullet(lwe.x,lwe.y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						blt.direction = dd0-15+i*10;
						blt.image_angle = blt.direction;
						blt.speed = -7-j*0.5;
						blt.depth -= 2;
						Anim_Create(blt,"speed",0,0,blt.speed,20,60);
						blt = MakeEnemyBullet(rwe.x,rwe.y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
						blt.direction = dd1-15+i*10;
						blt.image_angle = blt.direction;
						blt.speed = -7-j*0.5;
						blt.depth -= 2;
						Anim_Create(blt,"speed",0,0,blt.speed,20,60);
					}
				}
			}
			bb = !bb;
		}
	}
	if(attack_time > 150&&attack_time < 300){
		lwe.x += (x-200-lwe.x)/20;
		lwe.y += (y-lwe.y)/10;
		rwe.x += (x+200-rwe.x)/20;
		rwe.y += (y-rwe.y)/10;
		if(attack_time mod 10 = 1){
			a = MakeEnemyBullet(lwe.x,lwe.y,bullet_enemy_wavering);
			a.radius = 0;
			a.ring_width = 20;
			Anim_Create(a,"radius_spd",0,0,4,10,40);
		}
		if(attack_time mod 10 = 6){
			a = MakeEnemyBullet(rwe.x,rwe.y,bullet_enemy_wavering);
			a.radius = 0;
			a.ring_width = 20;
			Anim_Create(a,"radius_spd",0,0,4,10,40);
		}
	}
	if(attack_time = 300){
		Anim_Create(lwe,"vspeed",0,0,0,-20,30);
		lwe.duration = 60;
		Anim_Create(rwe,"vspeed",0,0,0,-20,30);
		rwe.duration = 60;
	}
	if(attack_time = 380){
		end_attack();
	}
}
	
attack_2 = function(){//摆动散射加垂直子弹
	live_name = "emitter_boss_shockwave_p1:attack_2";
	live;
	if(attack_time = 1){
		dd = -90;
	}
	if(attack_time < 120){
		dd = -90 + sin(attack_time/8)*40;
		if(attack_time mod 3 = 1){
			for(i=0;i<4;i+=1){
				blt = MakeEnemyBullet(x,y+100,bullet_enemy_normal);
				if((i = 1&&(attack_time div 3) mod 2 = 0)||(i = 2&&(attack_time div 3) mod 2 = 1)){
					with(blt){
						tt = other.attack_time;
						custom_function = function(){
							if(y > room_height-10&&x > 0&&x < room_width){
								y = room_height-10;
								speed = 0;
								duration = 120-tt+40;
								Anim_Create(id,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
								Anim_Create(id,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,1,20);
							}
							if(duration < 40&&duration > 0){
								if(duration mod 4 = 0){
									blt = MakeEnemyBullet(x,y,bullet_enemy_normal);
									blt.image_index = 1;
									blt.direction = 90;
									blt.speed = 30;
									blt.image_xscale = 2;
									blt.image_yscale = 2;
									Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,2,-1,10);
									Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,2,-1,10);
								}
							}
						}
					}
					blt.image_index = 1;
				}
				blt.direction = dd-15+10*i;
				blt.speed = 6;
				Anim_Create(blt,"speed",0,0,blt.speed,5,30);
			}
		}
	}
	if(attack_time = 250){
		end_attack();
	}
}
	
attack_3 = function(dir=0){//环绕双波
	live_name = "emitter_boss_shockwave_p1:attack_3";
	live;
	if(attack_time = 1){
		lwe = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		lwe.inv_block = true;                          // 后续帧仍会引用它, 免疫守卫/护盾清除
		lwe.image_alpha = 0;
		lwe.scale = 0.5;
		Anim_Create(lwe,"image_alpha",0,0,0,1,30);
		Anim_Create(lwe,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,30);
		Anim_Create(lwe,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,lwe.x,-250*(dir=0 ? 1 : -1),30);
		rwe = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		rwe.inv_block = true;                          // 后续帧仍会引用它, 免疫守卫/护盾清除
		rwe.image_alpha = 0;
		rwe.scale = 0.5;
		Anim_Create(rwe,"image_alpha",0,0,0,1,30);
		Anim_Create(rwe,"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,30);
		Anim_Create(rwe,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,rwe.x,250*(dir=0 ? 1 : -1),30);
	}
	if(attack_time > 30&&attack_time < 660){
		if(dir = 0){
			lwe.x += (x - sin((attack_time+30)/30)*250-lwe.x)/10;
			lwe.y += (y - cos((attack_time+30)/30)*250-lwe.y)/10;
			rwe.x += (x + sin((attack_time+30)/30)*250-rwe.x)/10;
			rwe.y += (y + cos((attack_time+30)/30)*250-rwe.y)/10;
		}
		else{
			lwe.x += (x + sin((attack_time+30)/30)*250-lwe.x)/10;
			lwe.y += (y + cos((attack_time+30)/30)*250-lwe.y)/10;
			rwe.x += (x - sin((attack_time+30)/30)*250-rwe.x)/10;
			rwe.y += (y - cos((attack_time+30)/30)*250-rwe.y)/10;
		}
	}
	if(attack_time > 45&&attack_time < 600){
		if(attack_time mod 15 = 0){
			wr = MakeEnemyBullet(lwe.x,lwe.y,bullet_enemy_wavering);
			wr.radius = 0;
			wr.radius_spd = 12;
			wr.ring_width = 20;
			wr.vspeed = 4;
			wr = MakeEnemyBullet(rwe.x,rwe.y,bullet_enemy_wavering);
			wr.radius = 0;
			wr.radius_spd = 12;
			wr.ring_width = 20;
		}
	}
	if(attack_time = 660){
		Anim_Create(lwe,"hspeed",0,0,0,20*(dir=0 ? 1 : -1),30);
		lwe.duration = 60;
		Anim_Create(rwe,"hspeed",0,0,0,-20*(dir=0 ? 1 : -1),30);
		rwe.duration = 60;
	}
	if(attack_time = 670){
		end_attack();
	}
}
	
attack_4 = function(c=0){//三连波
	live_name = "emitter_boss_shockwave_p1:attack_4";
	live;
	if(attack_time = 1){
		if(c = 0)wo = [200,0,0,800,room_width,1000];
		if(c = 1)wo = [600,0,200,room_height,room_width,room_height];
		if(c = 2)wo = [0,600,360,room_height,room_width,600];
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
	if(attack_time = 60){
		for(i=0;i<4;i+=1){
			wr = MakeEnemyBullet(wo[0],wo[1],bullet_enemy_wavering);
			wr.radius = 0;
			Anim_Create(wr,"radius",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,40+i*100,30);
			Anim_Create(wr,"radius_spd",0,0,0,12,60,120-attack_time);
		}
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
	if(attack_time = 80){
		for(i=0;i<4;i+=1){
			wr = MakeEnemyBullet(wo[2],wo[3],bullet_enemy_wavering);
			wr.radius = 0;
			Anim_Create(wr,"radius",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,40+i*100,30);
			Anim_Create(wr,"radius_spd",0,0,0,12,60,120-attack_time);
		}
	}
	if(attack_time = 100){
		for(i=0;i<4;i+=1){
			wr = MakeEnemyBullet(wo[4],wo[5],bullet_enemy_wavering);
			wr.radius = 0;
			Anim_Create(wr,"radius",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,40+i*100,30);
			Anim_Create(wr,"radius_spd",0,0,0,12,60,120-attack_time);
		}
	}
	if(attack_time = 220){
		end_attack();
	}
}
	
attack_5 = function(){//波加旋转散射
	live_name = "emitter_boss_shockwave_p1:attack_5";
	live;
	if(attack_time = 1){
		we = array_create(6,noone);
		we[0] = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		we[0].scale = 0.5;
		we[0].inv_block = true;                        // 后续弹幕仍会引用它, 免疫守卫/护盾清除
		Anim_Create(we[0],"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,60);
	}
	if(attack_time > 1&&attack_time < 340){
		for(i=0;i<6;i+=1){
			wep[i] = [x+lengthdir_x(200,-attack_time*0.7+60*i),y+lengthdir_y(200,-attack_time*0.7+60*i)];
			if(instance_exists(we[i])){
				we[i].x += (wep[i][0]-we[i].x)/10;
				we[i].y += (wep[i][1]-we[i].y)/10;
			}
		}
	}
	if(attack_time = 10){
		we[1] = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		we[1].scale = 0.5;
		we[1].inv_block = true;                        // 后续弹幕仍会引用它, 免疫守卫/护盾清除
		Anim_Create(we[1],"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,60);
	}
	if(attack_time = 20){
		we[2] = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		we[2].scale = 0.5;
		we[2].inv_block = true;                        // 后续弹幕仍会引用它, 免疫守卫/护盾清除
		Anim_Create(we[2],"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,60);
	}
	if(attack_time = 30){
		we[3] = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		we[3].scale = 0.5;
		we[3].inv_block = true;                        // 后续弹幕仍会引用它, 免疫守卫/护盾清除
		Anim_Create(we[3],"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,60);
	}
	if(attack_time = 40){
		we[4] = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		we[4].scale = 0.5;
		we[4].inv_block = true;                        // 后续弹幕仍会引用它, 免疫守卫/护盾清除
		Anim_Create(we[4],"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,60);
	}
	if(attack_time = 50){
		we[5] = MakeEnemyBullet(x,y,bullet_enemy_wavering_emitter);
		we[5].scale = 0.5;
		we[5].inv_block = true;                        // 后续弹幕仍会引用它, 免疫守卫/护盾清除
		Anim_Create(we[5],"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0.5,0.5,60);
	}
	if(attack_time = 100||attack_time = 200||attack_time = 300){
		for(i=0;i<6;i+=1){
			wr = MakeEnemyBullet(we[i].x,we[i].y,bullet_enemy_wavering);
			wr.radius = 0;
			wr.radius_spd = 10;
			wr.ring_width = 30;
			for(j=0;j<10;j+=1){
				for(k=0;k<4;k+=1){
					blt = MakeEnemyBullet(we[i].x,we[i].y,bullet_enemy_normal,spr_bullet_enemy_normal_2);
					blt.direction = -attack_time*0.7+60*i+36*j;
					blt.image_angle = blt.direction;
					blt.speed = 6+k;
					if(j mod 2 = 0){
						Anim_Create(blt,"direction",0,0,blt.direction,60,120,16-k*4);
						Anim_Create(blt,"image_angle",0,0,blt.image_angle,60,120,16-k*4);
					}
					else{
						Anim_Create(blt,"direction",0,0,blt.direction,-60,120,16-k*4);
						Anim_Create(blt,"image_angle",0,0,blt.image_angle,-60,120,16-k*4);
					}
				}
			}
		}
	}
	if(attack_time = 300){
		for(i=0;i<6;i+=1){
			Anim_Create(we[i],"scale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,-1,30);
			we[i].duration = 40;
		}
	}
	if(attack_time = 420){
		end_attack();
	}
}
	
attack_6 = function(){//散射蓝针加波
	live_name = "emitter_boss_shockwave_p1:attack_6";
	live;
	if(attack_time = 1||attack_time = 200||attack_time = 400){
		px = clamp(Player_GetPos()[0],200,room_width-200);
		py = clamp(Player_GetPos()[1],200,room_height-200);
		for(i=0;i<4;i+=1){
			wr = MakeEnemyBullet(px+lengthdir_x(200,90*i+45),py+lengthdir_y(200,90*i+45),bullet_enemy_wavering);
			wr.radius = 0;
			wr.radius_spd = 1;
			wr.ring_width = 30;
			wr.direction = 90*i+45;
			wr.speed = -1;
			Anim_Create(wr,"radius_spd",0,0,0,7,10,60);
		}
	}
	if(attack_time = 100||attack_time = 300||attack_time = 500){
		px = clamp(Player_GetPos()[0],200,room_width-200);
		py = clamp(Player_GetPos()[1],200,room_height-200);
		for(i=0;i<4;i+=1){
			wr = MakeEnemyBullet(px+lengthdir_x(200,90*i),py+lengthdir_y(200,90*i),bullet_enemy_wavering);
			wr.radius = 0;
			wr.radius_spd = 1;
			wr.ring_width = 30;
			wr.direction = 90*i;
			wr.speed = -1;
			Anim_Create(wr,"radius_spd",0,0,0,7,10,60);
		}
	}
	if(attack_time > 1&&attack_time < 500){
		if(attack_time mod 60 = 0){
			for(i=0;i<30;i+=1){
				blt = MakeEnemyBullet(x,y-76,bullet_enemy_blueneedle);
				blt.direction = 12*i+attack_time;
				blt.image_angle = blt.direction;
				blt.speed = 7;
				Anim_Create(blt,"image_xscale",0,0,0,1,60);
				Anim_Create(blt,"direction",0,0,blt.direction,90,180);
				Anim_Create(blt,"image_angle",0,0,blt.image_angle,90,180);
			}
		}
	}
	if(attack_time = 600){
		end_attack();
	}
}

var a0 = create_attack(0,attack_0,30);
var a1 = create_attack(1,attack_1,30);
var a2 = create_attack(2,attack_2,30);
var a3 = create_attack(3,attack_3,30);
var a4 = create_attack(4,attack_4,30);
var a5 = create_attack(5,attack_5,30);
var a6 = create_attack(6,attack_6,30);
var a7 = create_attack(7,attack_3,30,,1);
var a8 = create_attack(8,attack_4,30,,1);
var a9 = create_attack(9,attack_4,30,,2);

fixed_sequence = [a0,a1,a2,a3,a4,a5,a6,a7];
random_pool = [a0,a1,a2,a3,a4,a5,a6,a7,a8,a9]