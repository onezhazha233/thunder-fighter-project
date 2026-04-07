live;
event_inherited();

duration = -1
loop = false

rdm_attack = 0
rdm_attack_time = -1
rdm_attack_duration = [140,90,120,250,160,250,120,240,430]
last_attack = -1

attack_list = ds_list_create()

Clear = function(){
	with(bullet_enemy){
		if(mark = other.mark){
			if(inv_block = true){
				destroy_type = 4;
			}
			else{
				destroy_type = 1;
			}
			instance_destroy();
		}
	}
}

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

function attack_0(attack,exarg=0){//六向散射 120
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
	}
	if(attack.time = 2){
		dd = 0;
		Anim_Create(id,"dd",0,0,-1,10,9);
		Anim_Create(id,"dd",ANIM_TWEEN.QUAD,ANIM_EASE.IN,9,-9,9,9);
	}
	if(attack.time >= 2&&attack.time < 22&&attack.time mod 3 = 0){
		for(i=0;i<6;i+=1){
			blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
			blt.direction = dd+60*i+90;
			Anim_Create(blt,"direction",0,0,blt.direction,-dd,20,20);
			Anim_Create(blt,"speed",0,0,0,13,6);
			blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
			blt.direction = -dd+60*i+90;
			Anim_Create(blt,"direction",0,0,blt.direction,dd,20,20);
			Anim_Create(blt,"speed",0,0,0,13,6);
		}
	}
	if(attack.time = 2+18){
		dd = 0;
		Anim_Create(id,"dd",0,0,-1,10,9);
		Anim_Create(id,"dd",ANIM_TWEEN.QUAD,ANIM_EASE.IN,9,-9,9,9);
	}
	if(attack.time >= 2+18&&attack.time < 22+18&&attack.time mod 3 = 0){
		for(i=0;i<6;i+=1){
			blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
			blt.direction = dd+60*i+70;
			Anim_Create(blt,"direction",0,0,blt.direction,-dd,20,20);
			Anim_Create(blt,"speed",0,0,0,14,6);
			blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
			blt.direction = -dd+60*i+70;
			Anim_Create(blt,"direction",0,0,blt.direction,dd,20,20);
			Anim_Create(blt,"speed",0,0,0,14,6);
		}
	}
	if(attack.time = 2+36){
		dd = 0;
		Anim_Create(id,"dd",0,0,-1,10,9);
		Anim_Create(id,"dd",ANIM_TWEEN.QUAD,ANIM_EASE.IN,9,-9,9,9);
	}
	if(attack.time >= 2+36&&attack.time < 22+36&&attack.time mod 3 = 0){
		for(i=0;i<6;i+=1){
			blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
			blt.direction = dd+60*i+50;
			Anim_Create(blt,"direction",0,0,blt.direction,-dd,20,20);
			Anim_Create(blt,"speed",0,0,0,15,6);
			blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
			blt.direction = -dd+60*i+50;
			Anim_Create(blt,"direction",0,0,blt.direction,dd,20,20);
			Anim_Create(blt,"speed",0,0,0,15,6);
		}
	}
	if(attack.time = 2+54){
		dd = 0;
		Anim_Create(id,"dd",0,0,-1,10,9);
		Anim_Create(id,"dd",ANIM_TWEEN.QUAD,ANIM_EASE.IN,9,-9,9,9);
	}
	if(attack.time >= 2+54&&attack.time < 22+54&&attack.time mod 3 = 0){
		for(i=0;i<6;i+=1){
			blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
			blt.direction = dd+60*i+30;
			Anim_Create(blt,"direction",0,0,blt.direction,-dd,20,20);
			Anim_Create(blt,"speed",0,0,0,16,6);
			blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
			blt.direction = -dd+60*i+30;
			Anim_Create(blt,"direction",0,0,blt.direction,dd,20,20);
			Anim_Create(blt,"speed",0,0,0,16,6);
		}
	}
	if(attack.time = 90){
		mark.SetMoveEnabled(true);
		attack.End();
	}
}

function attack_1(attack,exarg=0){//延迟散射 60
	if(attack.time = 1||attack.time = 20||attack.time = 40||attack.time = 60){
		var dir = 90;
		if(Player_IsEnabled()){
			dir = point_direction(x,y,player.x,player.y);
		}
		for(var k=0;k<4;k+=1){
			var a = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
			a.image_xscale = 2;
			a.image_yscale = 2;
			a.direction = dir + k*90;
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
							for(var i=0;i<2;i+=1){
								var s = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
								s.image_xscale = 1;
								s.image_yscale = 1;
								s.direction = fire_dir + (i-0.5)*20;
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
	if(attack.time = 60){
		attack.End();
	}
}

function attack_2(attack,exarg=0){//连射扫射扇形狙 90
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
		dir = -90;
		if(Player_IsEnabled()){
			dir = point_direction(x,y,player.x,player.y);
		}
	}
	if(attack.time >= 1&&attack.time <= 21&&attack.time mod 4 = 1){
		for(i=0;i<10;i+=1){
			var blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
			blt.direction = dir-90+i*20+30-((attack.time-1) div 4)*10;
			Anim_Create(blt,"speed",0,0,10,-8,20);
			Anim_Create(blt,"speed",0,0,2,15,30,30);
		}
	}
	if(attack.time = 30){
		dir = -90;
		if(Player_IsEnabled()){
			dir = point_direction(x,y,player.x,player.y);
		}
	}
	if(attack.time >= 30&&attack.time <= 51&&attack.time mod 4 = 1){
		for(i=0;i<10;i+=1){
			var blt = MakeEnemyBullet(x,y,bullet_enemy_red,spr_bullet_enemy_darkpurple_0);
			blt.direction = dir-90+i*20-30+((attack.time-30) div 4)*10;
			Anim_Create(blt,"speed",0,0,10,-8,20);
			Anim_Create(blt,"speed",0,0,2,15,30,30);
		}
	}
	if(attack.time = 60){
		mark.SetMoveEnabled(true);
		attack.End();
	}
}

function attack_3(attack,exarg=0){//机炮加机关炮 210
	if(attack.time = 1){
		mark.move_range[3] -= 500;
		mark.SetSequence(seq_enemy_boss_large_og0_p2_attack_intro);
		dd = choose(0,1);
		mg = noone;
		if(dd = 0){
			mg = MakeEnemyBullet(x+130,y,bullet_enemy_umbra_apex_mega);
		}
		else{
			mg = MakeEnemyBullet(x-130,y,bullet_enemy_umbra_apex_mega);
		}
		mg.image_angle = -90;
		mg.duration = 120;
		mg.delay = 20;
		
	}
	if(attack.time > 1){
		if(instance_exists(mg)){
			if(dd = 0){
				mg.x = x + 130;
			}
			else{
				mg.x = x + 130;
			}
			mg.y = y;
		}
	}
	if(attack.time = 60){
		mark.SetSequence(seq_enemy_boss_large_og0_p2_attack);
	}
	if(attack.time > 60 && attack.time < 180){
		if(attack.time mod 4 = 0){
			var blt = MakeEnemyBullet(x,y,bullet_enemy_umbra_apex);
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
		for(i=0;i<2;i+=1){
			blt[i,0] = MakeEnemyBullet(x-32,y+25,bullet_enemy_laser_green);
			blt[i,0].delay = 60;
			blt[i,0].duration = 60;
			blt[i,0].sprite_ball = spr_bullet_enemy_laser_red_ball;
			blt[i,0].sprite_ring = spr_bullet_enemy_laser_red_ring;
			blt[i,0].sprite_laser_start = spr_bullet_enemy_laser_red_start;
			blt[i,0].sprite_laser = spr_bullet_enemy_laser_red;
			blt[i,0].sprite_effect = spr_bullet_enemy_effect_laser_red;
			blt[i,1] = MakeEnemyBullet(x+32,y+25,bullet_enemy_laser_green);
			blt[i,1].delay = 60;
			blt[i,1].duration = 60;
			blt[i,1].sprite_ball = spr_bullet_enemy_laser_red_ball;
			blt[i,1].sprite_ring = spr_bullet_enemy_laser_red_ring;
			blt[i,1].sprite_laser_start = spr_bullet_enemy_laser_red_start;
			blt[i,1].sprite_laser = spr_bullet_enemy_laser_red;
			blt[i,1].sprite_effect = spr_bullet_enemy_effect_laser_red;
		}
		Anim_Create(blt[0,0],"image_angle",0,0,blt[0,0].image_angle-90,30,60,60);
		Anim_Create(blt[1,0],"image_angle",0,0,blt[1,0].image_angle-60,40,60,60);
		Anim_Create(blt[0,1],"image_angle",0,0,blt[0,1].image_angle+60,-40,60,60);
		Anim_Create(blt[1,1],"image_angle",0,0,blt[1,1].image_angle+90,-30,60,60);
	}
	if(attack.time > 1){
		for(i=0;i<2;i+=1){
			if(instance_exists(blt[i,0])){
				blt[i,0].x = xprevious - 32;
				blt[i,0].y = yprevious + 25;
				blt[i,1].x = xprevious + 32;
				blt[i,1].y = yprevious + 25;
			}
		}
	}
	if(attack.time = 160){
		mark.move_range[3] += 700;
		attack.End();
	}
}

function attack_5(attack,exarg=0){//米加 180
	if(attack.time = 1){
		mark.move_range[3] -= 500;
	}
	if(attack.time = 20){
		px = 360;
		py = 860;
		if(Player_IsEnabled()){
			px = player.x;
			py = player.y;
		}
		mg = MakeEnemyBullet(px+200,py,bullet_enemy_umbra_apex_mega);
		mg.image_angle = 180;
		mg.delay = 60;
		mg.duration = 90;
		Anim_Create(mg,"hspeed",0,0,0,1,0,60);
		Anim_Create(mg,"vspeed",0,0,0,1,0,60);
	}
	if(attack.time = 30){
		mg = MakeEnemyBullet(px,py-200,bullet_enemy_umbra_apex_mega);
		mg.image_angle = -90;
		mg.delay = 50;
		mg.duration = 90;
		Anim_Create(mg,"hspeed",0,0,0,-1,0,50);
		Anim_Create(mg,"vspeed",0,0,0,-1,0,50);
	}
	if(attack.time = 40){
		mg = MakeEnemyBullet(px-200,py,bullet_enemy_umbra_apex_mega);
		mg.image_angle = 0;
		mg.delay = 40;
		mg.duration = 90;
		Anim_Create(mg,"hspeed",0,0,0,-1,0,40);
		Anim_Create(mg,"vspeed",0,0,0,-1,0,40);
	}
	if(attack.time = 50){
		mg = MakeEnemyBullet(px,py+200,bullet_enemy_umbra_apex_mega);
		mg.image_angle = 90;
		mg.delay = 30;
		mg.duration = 90;
		Anim_Create(mg,"hspeed",0,0,0,1,0,30);
		Anim_Create(mg,"vspeed",0,0,0,1,0,30);
	}
	
	if(attack.time = 180){
		mark.move_range[3] += 500;
		attack.End();
	}
}

function attack_6(attack,exarg=0){//六芒星 90
	if(attack.time = 1){
		mark.SetMoveEnabled(false);
		star_size = 200;
		point_count = 15;

		pos_list_a = [];
		pos_list_b = [];
		cx = x; cy = y;

		// 生成六芒星坐标的辅助函数
		var add_line = function(list, x1, y1, x2, y2) {
			for(var i=0; i<point_count; i++) {
			    var px = x1 + (x2 - x1) * (i / point_count);
			    var py = y1 + (y2 - y1) * (i / point_count);
			    // 如果距离中心点较近，标记为内圈（黄色区域）
			    var dist = point_distance(px, py, cx, cy);
			    array_push(list, {px: px, py: py, is_inner: (dist < (star_size * 0.6))});
			}
		};

		// 计算六个顶点
		var v1 = {x:cx, y:cy+star_size}; var v2 = {x:cx+star_size*0.866, y:cy-star_size/2}; var v3 = {x:cx-star_size*0.866, y:cy-star_size/2};
		var v4 = {x:cx, y:cy-star_size}; var v5 = {x:cx-star_size*0.866, y:cy+star_size/2}; var v6 = {x:cx+star_size*0.866, y:cy+star_size/2};

		// 构建六芒星路径
		add_line(pos_list_a, v1.x, v1.y, v2.x, v2.y); add_line(pos_list_a, v2.x, v2.y, v3.x, v3.y); add_line(pos_list_a, v3.x, v3.y, v1.x, v1.y);
		add_line(pos_list_b, v4.x, v4.y, v5.x, v5.y); add_line(pos_list_b, v5.x, v5.y, v6.x, v6.y); add_line(pos_list_b, v6.x, v6.y, v4.x, v4.y);

		all_bullets = array_create(array_length(pos_list_a) + array_length(pos_list_b), noone);
		build_len = max(array_length(pos_list_a), array_length(pos_list_b));
	}
	if (attack.time >= 10 && attack.time < 10 + build_len) {
	    var idx = attack.time - 10;
	    if (idx < array_length(pos_list_a)) {
	        var p = pos_list_a[idx];
	        var inst = MakeEnemyBullet(p.px, p.py, bullet_enemy_red, spr_bullet_enemy_darkpurple_0);
	        with(inst) {
	            is_inner = p.is_inner;
	            speed = 0;
	        }
	        all_bullets[idx] = inst;
	    }
	    if (idx < array_length(pos_list_b)) {
	        var p2 = pos_list_b[idx];
	        var inst2 = MakeEnemyBullet(p2.px, p2.py, bullet_enemy_red, spr_bullet_enemy_darkpurple_0);
	        with(inst2) {
	            is_inner = p2.is_inner;
	            speed = 0;
	        }
	        all_bullets[array_length(pos_list_a) + idx] = inst2;
	    }
	}

	var end_time = 10 + build_len;
	if (attack.time == end_time) {
	    for (var i = 0; i < array_length(all_bullets); i++) {
	        if (instance_exists(all_bullets[i]) && all_bullets[i].is_inner) {
	            with(all_bullets[i]) {
	                direction = point_direction(x, y, other.x, other.y);
	                Anim_Create(id,"speed",0,0,0,15,30);
					Anim_Create(id,"direction",0,0,direction,-30,40);
	            }
	        }
	    }
	}

	if (attack.time == end_time+5) {
	    for (var i = 0; i < array_length(all_bullets); i++) {
	        if (instance_exists(all_bullets[i]) && !all_bullets[i].is_inner) {
	            with(all_bullets[i]) {
	                direction = point_direction(x, y, other.x, other.y);
	                Anim_Create(id,"speed",0,0,0,15,40);
	                Anim_Create(id,"direction",0,0,direction,30,40);
	            }
	        }
	    }
	}
	if(attack.time = 90){
		mark.SetMoveEnabled(true);
		attack.End();
	}
}

function attack_7(attack,exarg=0){//导弹 180
	if(attack.time = 1){
		aa = 0;
		mark.SetSequence(seq_enemy_boss_large_og0_p2_attack_intro);
	}
	if(attack.time > 60&&attack.time mod 20 = 1&&attack.time < 180){
		a = MakeEnemyBullet(x,y,bullet_enemy_umbra_apex_ap);
		a.direction = 0;
		a.image_angle = -90;
		a.speed = 10;
		Anim_Create(a,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.image_angle,-90,30);
		Anim_Create(a,"direction",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.direction,-90,30);
		Anim_Create(a,"speed",0,0,10,8,20,30);
		a = MakeEnemyBullet(x,y,bullet_enemy_umbra_apex_ap);
		a.direction = 0-50;
		a.image_angle = -90-50;
		a.speed = 5;
		Anim_Create(a,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.image_angle,-90+50,30);
		Anim_Create(a,"direction",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.direction,-90+50,30);
		Anim_Create(a,"speed",0,0,5,18,10,30);
		a = MakeEnemyBullet(x,y,bullet_enemy_umbra_apex_ap);
		a.direction = 180;
		a.image_angle = 90;
		a.speed = 10;
		Anim_Create(a,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.image_angle,90,30);
		Anim_Create(a,"direction",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.direction,90,30);
		Anim_Create(a,"speed",0,0,10,8,20,30);
		a = MakeEnemyBullet(x,y,bullet_enemy_umbra_apex_ap);
		a.direction = 180+50;
		a.image_angle = 90+50;
		a.speed = 5;
		Anim_Create(a,"image_angle",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.image_angle,90-50,30);
		Anim_Create(a,"direction",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,a.direction,90-50,30);
		Anim_Create(a,"speed",0,0,5,18,10,30);
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
		//mark.SetMoveEnabled(false);
		//mark.SetSequence(seq_enemy_boss_large_og0_p2_attack_intro);
		var tx = room_width/2;
		var ty = room_height*0.2;
		//Anim_Destroy(mark,"x");
		//Anim_Destroy(mark,"y");
		//Anim_Create(mark,"x",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,mark.x,tx-mark.x,move_time);
		//Anim_Create(mark,"y",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,mark.y,ty-mark.y,move_time);
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
