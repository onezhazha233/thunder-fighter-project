live;
event_inherited();

duration = -1
loop = false

rdm_attack = 0
rdm_attack_time = -1
rdm_attack_duration = [90,120,60,250,160,250,150,350,430]
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
		case 5: attack_5(attack,attack.exarg); break;
		case 6: attack_6(attack,attack.exarg); break;
		case 7: attack_7(attack,attack.exarg); break;
		case 8: attack_8(attack,attack.exarg); break;
	}
}

function attack_0(attack,exarg=0){//六向散射 60
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
	}
	if(attack.time < 60&&attack.time mod 8 = 1){
		for(i=0;i<6;i+=1){
			for(j=0;j<4;j+=1){
				blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkred_0);
				blt.direction = i*60+45+j*5+time*5;
				blt.speed = 15-j;
			}
		}
	}
	if(attack.time = 60){
		mark.SetMoveEnabled(true);
		attack.End();
	}
}

function attack_1(attack,exarg=0){//延迟散射 120
	if(attack.time = 1||attack.time = 30||attack.time = 60){
		var dir = 90;
		if(Player_IsEnabled()){
			dir = point_direction(x,y,player.x,player.y);
		}
		for(var k=0;k<3;k+=1){
			var a = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkred_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			a.direction = dir + k*120;
			a.image_angle = a.direction;
			a.speed = 3;
			a.duration = -1;
			a.fire_dir = a.direction;
			with(a){
				age = 0;
				burst_count = 0;
				custom_function = function(){
					age += 1;
					if(age >= 30){
						if((age-30) mod 5 = 0 && burst_count < 3){
							for(var i=0;i<3;i+=1){
								var s = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkred_0);
								s.image_xscale = 1;
								s.image_yscale = 1;
								s.direction = fire_dir + (i-1)*30;
								s.image_angle = s.direction;
								s.speed = 12;
								s.bounced = false;
								with(s){
									custom_function = function(){
										if(!bounced){
											if(x <= 0 || x >= room_width){
												if(x <= 0)x = 0;
												if(x >= room_width)x = room_width;
												hspeed *= -1;
												bounced = true;
											}
											if(y <= 0 || y >= room_height){
												if(y <= 0)y = 0;
												if(y >= room_height)y = room_height;
												vspeed *= -1;
												bounced = true;
											}
										}
									}
								}
							}
							burst_count += 1;
							if(burst_count >= 3){
								destroy_type = 3;
								instance_destroy();
							}
						}
					}
				}
			}
		}
	}
	if(attack.time = 120){
		attack.End();
	}
}

function attack_2(attack,exarg=0){//连射扇形狙 40
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
		dir = -90;
		if(Player_IsEnabled()){
			dir = point_direction(x,y,player.x,player.y);
		}
	}
	if(attack.time >= 1&&attack.time <= 31&&attack.time mod 5 = 1){
		for(i=0;i<10;i+=1){
			var blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkred_0);
			blt.direction = dir-90+i*20;
			blt.speed = 15;
		}
	}
	if(attack.time = 40){
		mark.SetMoveEnabled(true);
		attack.End();
	}
}

function attack_3(attack,exarg=0){//机炮加机关炮 210
	if(attack.time = 1){
		mark.move_range[3] -= 500;
		mark.SetSequence(seq_enemy_boss_large_15_p2_attack_intro);
		dd = choose(0,1);
		sc = noone;
		if(dd = 0){
			sc = MakeEnemyBullet(x+130,y,bullet_enemy_dark_assault_shotcannon);
		}
		else{
			sc = MakeEnemyBullet(x-130,y,bullet_enemy_dark_assault_shotcannon);
		}
		sc.duration = 120;
		sc.delay = 30;
		sc.interval = 10;
		
	}
	if(attack.time > 1){
		if(instance_exists(sc)){
			if(dd = 0){
				sc.x = x + 130;
			}
			else{
				sc.x = x - 130;
			}
			sc.y = y;
		}
	}
	if(attack.time = 60){
		mark.SetSequence(seq_enemy_boss_large_15_p2_attack);
	}
	if(attack.time > 60 && attack.time < 180){
		if(attack.time mod 4 = 0){
			var blt = MakeEnemyBullet(x,y,bullet_enemy_dark_assault);
			blt.vspeed = 45;
		}
	}
	if(attack.time = 180){
		mark.move_range[3] += 500;
		mark.SetState(ENEMY_STATE.IDLE);
	}
	if(attack.time = 210){
		attack.End();
	}
}

function attack_4(attack,exarg=0){//收缩移动激光 160
	if(attack.time = 1){
		mark.move_range[3] -= 700;
		for(i=0;i<4;i+=1){
			blt[i] = MakeEnemyBullet(x,y+85,bullet_enemy_laser_green);
			blt[i].delay = 60;
			blt[i].duration = 60;
		}
		Anim_Create(blt[0],"image_angle",0,0,blt[0].image_angle-90,60,60,60);
		Anim_Create(blt[1],"image_angle",0,0,blt[1].image_angle-30,20,60,60);
		Anim_Create(blt[2],"image_angle",0,0,blt[2].image_angle+30,-20,60,60);
		Anim_Create(blt[3],"image_angle",0,0,blt[3].image_angle+90,-60,60,60);
	}
	if(attack.time > 1){
		for(i=0;i<4;i+=1){
			if(instance_exists(blt[i])){
				blt[i].x = xprevious;
				blt[i].y = yprevious + 85;
			}
		}
	}
	if(attack.time = 160){
		mark.move_range[3] += 700;
		attack.End();
	}
}

function attack_5(attack,exarg=0){//机关炮 50
	if(attack.time = 1){
		mark.move_range[3] -= 500;
	}
	if(attack.time = 20){
		sc0 = MakeEnemyBullet(x-100,y,bullet_enemy_dark_assault_shotcannon);
		sc0.duration = 120;
		sc0.interval = 10;
		sc1 = MakeEnemyBullet(x+100,y,bullet_enemy_dark_assault_shotcannon);
		sc1.duration = 115;
		sc1.interval = 10;
		sc1.delay = 5;
	}
	if(attack.time = 50){
		if(x < room_width/2){
			sc0.hspeed = 1.8;
			sc1.hspeed = 1.8;
		}
		else{
			sc0.hspeed = -1.8;
			sc1.hspeed = -1.8;
		}
		mark.move_range[3] += 500;
		attack.End();
	}
}

function attack_6(attack,exarg=0){//中心散射加狙 40
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
	}
	if(attack.time = 20){
		for(i=0;i<12;i+=1){
			for(j=0;j<3;j+=1){
				blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkred_0);
				blt.direction = 30*i;
				blt.speed = 15-j;
				Anim_Create(blt,"speed",0,0,15-j,-7-j,0,10);
				if(j = 1&&i mod 2 = 0){
					with(blt){
						duration = 45;
						custom_function = function(){
							if(duration = 1){
								destroy_type = 3;
								for(i=0;i<4;i+=1){
									bb = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkred_0);
									Anim_Create(bb,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,x,lengthdir_x(60,45+i*90),20);
									Anim_Create(bb,"y",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,y,lengthdir_y(60,45+i*90),20);
									with(bb){
										duration = 20;
										custom_function = function(){
											if(duration = 1){
												duration = -1;
												direction = point_direction(x,y,player.x,player.y);
												Anim_Create(id,"speed",0,0,0,20,10);
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	if(attack.time = 40){
		mark.SetMoveEnabled(true);
		attack.End();
	}
}

function attack_7(attack,exarg=0){//导弹 180
	if(attack.time = 1){
		aa = 0;
		mark.SetSequence(seq_enemy_boss_large_15_p2_attack_intro);
	}
	if(attack.time > 60&&attack.time mod 30 = 1&&attack.time < 180){
		aa = !aa;
		var base_dir = 90;
		if(Player_IsEnabled()){
			base_dir = point_direction(x,y,player.x,player.y);
		}
		for(var k=0;k<4;k+=1){
			var m = MakeEnemyBullet(x,y,bullet_enemy_dark_assault_missile);
			m.direction = base_dir + k*90+aa*45;
			m.image_angle = m.direction - 90;
			m.speed = 12;
			m.duration = 200;
			with(m){
				track_time = 60;
				age = 0;
				custom_function = function(){
					age += 1;
					if(age <= track_time && Player_IsEnabled()){
						//direction += (point_direction(x,y,player.x,player.y) - direction)/10;
						target_angle = point_direction(x,y,player.x,player.y);
						direction += angle_difference(target_angle,direction)/10;
						image_angle = direction - 90;
					}
					if(age >= track_time){
						speed += 0.1;
					}
				}
			}
		}
	}
	if(attack.time = 180){
		mark.SetState(ENEMY_STATE.IDLE);
		attack.End();
	}
}

function attack_8(attack,exarg=0){//散射导弹 400
	var move_time = 20;
	var side_fire_start = 60;
	var side_fire_end = 100;
	var side_interval = 3;
	var bottom_fire_start = 100;
	var bottom_fire_end = 300;
	var bottom_interval = 4;
	var end_time = 400;
	
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
		mark.SetSequence(seq_enemy_boss_large_15_p2_attack_intro);
		var tx = room_width/2;
		var ty = room_height*0.2;
		Anim_Destroy(mark,"x");
		Anim_Destroy(mark,"y");
		Anim_Create(mark,"x",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,mark.x,tx-mark.x,move_time);
		Anim_Create(mark,"y",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,mark.y,ty-mark.y,move_time);
	}
	if(attack.time >= side_fire_start && attack.time <= side_fire_end){
		if((attack.time - side_fire_start) mod side_interval = 0){
			var spread = 20;
			var off0 = sin((attack.time+11)*987)*spread;
			var off1 = sin((attack.time+37)*987)*spread;
			var bl = MakeEnemyBullet(x,y,bullet_enemy_dark_assault_missile);
			bl.direction = 180 + off0;
			bl.image_angle = bl.direction - 90;
			bl.speed = 16;
			bl.inv_block = true;
			bl.duration = 60;
			var br = MakeEnemyBullet(x,y,bullet_enemy_dark_assault_missile);
			br.direction = 0 + off1;
			br.image_angle = br.direction - 90;
			br.speed = 16;
			br.inv_block = true;
			br.duration = 60;
		}
	}
	if(attack.time = bottom_fire_start){
		mark.SetState(ENEMY_STATE.IDLE);
	}
	if(attack.time >= bottom_fire_start && attack.time <= bottom_fire_end){
		if((attack.time - bottom_fire_start) mod bottom_interval = 0){
			var base_dir = point_direction(0,room_height,room_width/2,800);
			var spread = 20;
			var offset0 = sin((attack.time+0)*1234)*spread;
			var offset1 = sin((attack.time+7)*1234)*spread;
			var b0 = MakeEnemyBullet(-400,room_height+400,bullet_enemy_dark_assault_missile);
			b0.direction = base_dir + offset0;
			b0.image_angle = b0.direction - 90;
			b0.speed = 14;
			b0.inv_block = true;
			b0.duration = 200;
			var b1 = MakeEnemyBullet(room_width+400,room_height+400,bullet_enemy_dark_assault_missile);
			b1.direction = 180-base_dir + offset1;
			b1.image_angle = b1.direction - 90;
			b1.speed = 14;
			b1.inv_block = true;
			b1.duration = 200;
		}
	}
	
	if(attack.time = end_time){
		mark.SetMoveEnabled(true);
		attack.End();
	}
}
