event_inherited();

attack_0 = function(){//水蓝
	if(attack_time = 1){
		aa = 0;
		ea = 0;
		rot = 1.5;
		a0d = 630;
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				ix = -1100+i*150;
				iy = -1000+j*150;
				if!(point_in_rectangle(mouse_x,mouse_y,ix-75,iy-75,ix+75,iy+75)){
					bb[i][j] = MakeEnemyBullet(ix,iy,bullet_enemy_normal);
					bb[i][j].sprite_index = spr_pixel2x;
					bb[i][j].image_xscale = 70;
					bb[i][j].image_yscale = 10;
					bb[i][j].image_alpha = 0;
					bb[i][j].direction = -90;
					bb[i][j].speed = 3;
					bb[i][j].mask_index = -1;
					bb[i][j].auto_destroy = false;
				}
				else{
					ei = i;
					ej = j;
				}
				Anim_Create(id,"aa",0,0,0,1,40);
			}
		}
		
	}
	if(attack_time > 1){
		if(bb[0][0].x > -1100+600){
			for(i=0;i<20;i+=1){
				for(j=0;j<30;j+=1){
					if(instance_exists(bb[i][j]))bb[i][j].x -= 600;
				}
			}
		}
		if(bb[0][0].y > -1000+600){
			for(i=0;i<20;i+=1){
				for(j=0;j<30;j+=1){
					if(instance_exists(bb[i][j]))bb[i][j].y -= 600;
				}
			}
		}
		if(bb[0][0].x < -1100-600){
			for(i=0;i<20;i+=1){
				for(j=0;j<30;j+=1){
					if(instance_exists(bb[i][j]))bb[i][j].x += 600;
				}
			}
		}
		if(bb[0][0].y < -1100-600){
			for(i=0;i<20;i+=1){
				for(j=0;j<30;j+=1){
					if(instance_exists(bb[i][j]))bb[i][j].y += 600;
				}
			}
		}
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				if(instance_exists(bb[i][j]))bb[i][j].image_angle -= rot;
				if(instance_exists(bb[i][j]))dist = point_distance(bb[i][j].x,bb[i][j].y,mouse_x,mouse_y);
				ba = 1;
				if(dist < 200)ba = 1;
				if(dist >= 200&&dist < 300)ba = 1-(dist-200)/100;
				if(dist >= 300)ba = 0;
				if(instance_exists(bb[i][j])){
					bb[i][j].image_alpha = ba*aa;
					if(i = ei&&j = ej){
						bb[i][j].image_alpha =ba*aa*ea;
					}
				}
			}
		}
	}
	if(attack_time = 40){
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				with(bb[i][j])mask_index = sprite_index;
			}
		}
	}
	if(attack_time mod 120 = 0&&attack_time<a0d-90){
		if(!instance_exists(bb[ei][ej])){
			bb[ei][ej] = MakeEnemyBullet(bb[ei-1][ej].x+150,bb[ei-1][ej].y,bullet_enemy_normal);
			bb[ei][ej].sprite_index = spr_pixel2x;
			bb[ei][ej].image_xscale = 70;
			bb[ei][ej].image_yscale = 10;
			bb[ei][ej].image_alpha = 0;
			bb[ei][ej].speed = 3;
			bb[ei][ej].direction = bb[0][0].direction;
			bb[ei][ej].auto_destroy = false;
			Anim_Create(id,"ea",0,0,0,1,40);
		}
		rdm = 45*(sign(sin(attack_time*159)*753));
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				if(instance_exists(bb[i][j]))Anim_Create(bb[i][j],"direction",0,0,bb[i][j].direction,rdm,80);
			}
		}
	}
	if(attack_time = a0d-90){
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				bb[i][j].mask_index = -1;
				Anim_Create(bb[i][j],"speed",0,0,bb[i][j].speed,-bb[i][j].speed,60);
				Anim_Create(id,"rot",0,0,rot,-rot,60);
				Anim_Create(id,"aa",0,0,1,-1,60,30);
			}
		}
	}
	if(attack_time = a0d){
		for(i=0;i<20;i+=1){
			for(j=0;j<30;j+=1){
				if(instance_exists(bb[i][j])){
					bb[i][j].destroy_type = 3;
					instance_destroy(bb[i][j]);
				}
			}
		}
		end_attack();
	}
}
	
attack_1 = function(){//延迟五六连续散射
	live_name = "emitter_enemy_test:attack_1";
	live;
	if(attack_time = 1){
		a = 0;
	}
	if(attack_time < 25){
		if(attack_time mod 5 = 1){
			blt = MakeEnemyBullet(x,y,bullet_enemy_normal);
			blt.direction = a*72-90;
			blt.a = a;
			Anim_Create(blt,"speed",0,0,15,-15,30);
			with(blt){
				time = 0;
				aa = 0;
				custom_function = function(){
					time += 1;
					if(time >= 60-a*6&&time <= 110-a*6&&(time-a*6) mod 10 = 0){
						for(i=0;i<5;i+=1){
							blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
							blt.direction = direction + (aa*25+i*20)*(i mod 2 = 0 ? 1 : -1)+160;
							blt.image_angle = blt.direction;
							blt.speed = 10+(i mod 2 = 0 ? 2 : 0);
							Anim_Create(blt,"speed",0,0,speed,-speed/2+5,10,10);
							Anim_Create(blt,"speed",0,0,5,5+i,30,(60-i*5));
						}
						aa += 1;
					}
					if(time > 110-a*6)duration = 1;
				}
			}
			a += 1;
		}
	}
	if(attack_time = 120){
		a = 0;
	}
	if(attack_time > 120&&attack_time < 150){
		if(attack_time mod 5 = 1){
			blt = MakeEnemyBullet(x,y,bullet_enemy_normal);
			blt.direction = -a*60;
			blt.a = a;
			Anim_Create(blt,"speed",0,0,15,-15,30);
			with(blt){
				time = 0;
				aa = 0;
				custom_function = function(){
					time += 1;
					if(time >= 60-a*6&&time <= 110-a*6&&(time-a*6) mod 10 = 0){
						for(i=0;i<5;i+=1){
							blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_1);
							blt.direction = direction + (aa*25+i*20)*(i mod 2 = 0 ? 1 : -1)+160;
							blt.image_angle = blt.direction;
							blt.speed = 10+(i mod 2 = 0 ? 2 : 0);
							Anim_Create(blt,"speed",0,0,speed,-speed/2+5,10,10);
							Anim_Create(blt,"speed",0,0,5,5+i,30,(60-i*5));
						}
						aa += 1;
					}
					if(time > 110-a*6)duration = 1;
				}
			}
			a += 1;
		}
	}
	if(attack_time = 300){
		end_attack();
	}
}
	
attack_2 = function(){
	live_name = "emitter_enemy_test:attack_2";
	live;
	
}

var a0 = create_attack(0,attack_0,30);
var a1 = create_attack(0,attack_1,30);
var a2 = create_attack(0,attack_2,30);

fixed_sequence = [a1];
//random_pool = [a1]//循环测试用