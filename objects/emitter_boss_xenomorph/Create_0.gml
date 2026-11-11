//live;
event_inherited();

attack_0 = function(){//收缩瞄准散射
	live_name = "emitter_boss_xenomorph:attack_0";
	live;
	if(attack_time = 1){
		rr = 240;
		Anim_Create(id,"rr",0,0,rr,10-rr,90);
		var _tx = Player_GetPos()[0];
		var _ty = Player_GetPos()[1];
		dd = point_direction(x,y+80,_tx,_ty);
		mark.SetMoveEnabled(false);
		During(1,100,10,function(){
			mark.SetSequence(seq_enemy_boss_mini_og3_attack_0);
			for(i=0;i<9;i+=1){
				bb = MakeEnemyBullet(x,y+80,bullet_enemy_normal);
				bb.direction = dd-4*(rr/9)+i*(rr/9);
				bb.speed = 3;
				bb.image_xscale = 2;
				bb.image_yscale = 2;
				Anim_Create(bb,"speed",0,0,3,10,20,40);
			}
		});
	}
	if(attack_time = 140){
		mark.SetMoveEnabled(true);
		end_attack();
	}
}
	
attack_1 = function(){//八向反弹加曲线狙
	live_name = "emitter_boss_xenomorph:attack_1";
	live;
	if(attack_time = 1){
		tx = Player_GetPos()[0];
		ty = Player_GetPos()[1];

		// ---- A. 八向反弹：每 6 帧一次，第 6..294 帧 ----
		// 前 100 帧隔一个方向发 4 发，之后每个方向发 8 发
		During(6, 300, 6, function(_idx, _t){
			var _st = (_t < 100) ? 2 : 1;
			var dd, bb;
			for(var i = 0; i < 8; i += _st){
				dd = i*45 + 22.5;
				bb = MakeEnemyBullet(x + lengthdir_x(80, dd), y + lengthdir_y(80, dd), bullet_enemy_normal);
				bb.image_index = 4;
				bb.direction = dd;
				bb.bounced = false;
				bb.image_xscale = 3;
				bb.image_yscale = 3;
				bb.image_alpha = 0;
				bb.time = 0;
				Anim_Create(bb,"image_xscale",0,0,3,-2,20);
				Anim_Create(bb,"image_yscale",0,0,3,-2,20);
				Anim_Create(bb,"image_alpha",0,0,0,1,20);
				Anim_Create(bb,"speed",0,0,0,12,0,10);
				with(bb){
					custom_function = function(){
						if(bounced = false){
							if(x <= 0 || x >= room_width){
								if(x <= 0)x = abs(x);
								if(x >= room_width)x = room_width-(x-room_width);
								hspeed *= -1;
								bounced = true;
							}
							else if(y <= 0 || y >= room_height){
								if(y <= 0)y = abs(y);
								if(y >= room_height)y = room_height-(y-room_height);
								vspeed *= -1;
								bounced = true;
							}
						}
						time += 1;
						if(time mod 20 = 0){
							Anim_Create(id,"image_xscale",0,0,2,-1,10);
							Anim_Create(id,"image_yscale",0,0,2,-1,10);
						}
					}
				}
			}
		});

		// ---- B1. 每 40 帧的 boss 动作重置：第 40/50/60、80/90/100 ... 帧 ----
		During(10, 300, 10, function(_idx, _t){
			var _m = _t mod 40;
			if(_m = 0 || _m = 10 || _m = 20){
				mark.SetSequence(seq_enemy_boss_mini_og3_attack_0);
				if(_m = 0){
					tx = Player_GetPos()[0];
					ty = Player_GetPos()[1];
				}
			}
		});

		// ---- B2. 曲线追踪弹：每 3 帧，仅 mod 40 < 25 的窗口内 ----
		During(3, 300, 3, function(_idx, _t){
			if(_t mod 40 >= 25) return;

			var _side = ((_t div 40) mod 2 == 0) ? 1 : -1;
			var bb;
			for(var k = 0; k < 2; k += 1){
				bb = MakeEnemyBullet(x,y+80,bullet_enemy_normal,spr_bullet_enemy_bug);
				bb.img = 0;
				bb.aim_x = tx;
				bb.aim_y = ty;
				bb.wave_side = _side;
				bb.spread_deg = (k == 0) ? 45 : 90;
				bb.x += (k=1)*_side*60;
				bb.y -= (k=1)*30;

				with(bb){
					var _sx = x;
					var _sy = y;
					var _launch = point_direction(_sx,_sy,aim_x,aim_y) + wave_side*spread_deg;

					p0x = _sx;
					p0y = _sy;
					p1x = _sx + lengthdir_x(100,_launch);
					p1y = _sy + lengthdir_y(100,_launch);
					p2x = _sx + lengthdir_x(300,_launch);
					p2y = _sy + lengthdir_y(300,_launch);
					p3x = aim_x;
					p3y = aim_y;
					launch_dir = _launch;

					direction = _launch;
					image_angle = direction;
					speed = 0;

					b_t = 0;
					track_perm = 0.03;
					init_v = 12;
					bezier_done = false;

					// 必须 method(id,...) 绑定到子弹自身：
					// 裸匿名函数可能落到发射器上，p3x/aim_x 会被下一批覆盖，
					// 表现为曲线弹飞到一半目标坐标突变。
					custom_function = method(id, function(){
						img += 1;
						if(img mod 6 = 0)image_index = !image_index;
						if(bezier_done = false){
							b_t += track_perm;
							var tt = min(b_t,1);
							var u = 1 - tt;
							var px = x;
							var py = y;
							x = u*u*u*p0x + 3*u*u*tt*p1x + 3*u*tt*tt*p2x + tt*tt*tt*p3x;
							y = u*u*u*p0y + 3*u*u*tt*p1y + 3*u*tt*tt*p2y + tt*tt*tt*p3y;
							var ddx = x - px;
							var ddy = y - py;
							if(ddx*ddx + ddy*ddy > 0.0001){
								direction = point_direction(px,py,x,y);
								image_angle = direction;
							}
							if(b_t >= 1){
								bezier_done = true;
								if(point_distance(p2x,p2y,p3x,p3y) > 1){
									direction = point_direction(p2x,p2y,p3x,p3y);
								}
								else{
									direction = launch_dir;
								}
								image_angle = direction;
								speed = init_v;
							}
						}
					});
				}
			}
		});

		At(350, function(){ end_attack(); });
	}
}
	
attack_2 = function(){//左右下落加激光
	live_name = "emitter_boss_xenomorph:attack_2";
	live;

	// 激光跟随本体（每帧），不进调度器
	if(attack_time > 1){
		if(instance_exists(l0)){
			l0.x = x;
			l0.y = y + 80;
		}
		if(instance_exists(l1)){
			l1.x = x - 55;
			l1.y = y + 130;
		}
		if(instance_exists(l2)){
			l2.x = x + 55;
			l2.y = y + 130;
		}
		if(instance_exists(l3)){
			l3.x = x - 95;
			l3.y = y + 85;
		}
		if(instance_exists(l4)){
			l4.x = x + 95;
			l4.y = y + 85;
		}
	}

	if(attack_time = 1){
		l0 = MakeEnemyLaser(1,x,y+80,1,-90,60,60);
		l1 = noone;
		l2 = noone;
		l3 = noone;
		l4 = noone;

		// 第 90 / 180 帧追加激光
		At(90, function(){
			l1 = MakeEnemyLaser(1,x-55,y+130,1,-90,60,60);
			l2 = MakeEnemyLaser(1,x+55,y+130,1,-90,60,60);
		});
		At(180, function(){
			l3 = MakeEnemyLaser(1,x-95,y+85,1,-90,60,30);
			l4 = MakeEnemyLaser(1,x+95,y+85,1,-90,60,30);
		});

		// 本体动作重置：第 11,21,...,231 帧。
		// 60 帧为一周期，前 30 帧用 _1_0，后 30 帧用 _1_1
		During(11, 240, 10, function(_idx, _t){
			var _m = _t mod 60;
			if(_m > 0 && _m < 30){
				mark.SetSequence(seq_enemy_boss_mini_og3_attack_1_0);
			}
			else if(_m > 30 && _m < 60){
				mark.SetSequence(seq_enemy_boss_mini_og3_attack_1_1);
			}
		});

		// 左右交替弹幕：每 4 帧一次，60 帧周期内前半段打左、后半段打右。
		// 原先两段几乎相同的发射合并为一处，靠 _left 区分朝向与初速
		During(4, 240, 4, function(_idx, _t){
			var _m = _t mod 60;
			var _left;
			if(_m > 0 && _m < 30)      _left = true;
			else if(_m > 30 && _m < 60) _left = false;
			else return;   // _m = 0 / 30：周期交界帧，两侧都不发

			var _ox   = _left ? -60 : 60;   // 发射点横向偏移
			var _base = _left ? 2 : -2;     // 原式末尾的 +2 / -2
			var bb;
			for(var i = 0; i < 7; i++){
				bb = MakeEnemyBullet(x + _ox, y - 115, bullet_enemy_normal, spr_bullet_enemy_normal_1);
				bb.hspeed = -3*2 + i*2 + _base;
				if(_t mod 12 = 0){
					bb.hspeed *= 1.5;
					bb.vspeed -= 2;
				}
				bb.vspeed = -10;
				bb.gravity = 0.5;
				bb.image_angle = 90;
				with(bb){
					px = x;
					py = y;
					custom_function = method(id, function(){
						image_angle = point_direction(px,py,x,y);
						px = x;
						py = y;
					});
				}
			}
		});

		At(300, function(){ end_attack(); });
	}
}
	
attack_3 = function(){//散射下落加扩散反弹狙
	live_name = "emitter_boss_xenomorph:attack_3";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		mark.SetSequence(seq_enemy_boss_mini_og3_attack_2_intro);

		// A/B 两段的发射节奏完全相同，只有 tt 基准相差 60 帧；
		// 第 41,61,81 帧为 A（上下扩散朝外），第 101,121,141 帧为 B（朝内）。
		// 每段内距首发 49/29/9 帧，用 _idx mod 3 还原，不依赖 t 的绝对值。
		During(41, 150, 20, function(_idx, _t){
			var _isA = (_t < 90);
			var _dur = 49 - (_idx mod 3) * 20;
			var _off, _tt, _yy, bb;
			for(var i = 0; i < 9; i++){
				_off = _isA ? i : (8 - i);
				_tt  = _dur + _off*10;
				for(var s = 0; s < 2; s++){
					// s = 0 上排 / 1 下排，两排的 y 偏移量并不对称，按原式分别取
					_yy = (s == 0)
						? y + abs(4-i)*30 - 170
						: y - abs(4-i)*30 + 110;
					bb = MakeEnemyBullet(x - (4-i)*30, _yy, bullet_enemy_normal);
					bb.image_index = 4;
					bb.direction = point_direction(x,y-30,bb.x,bb.y);
					bb.speed = 6;
					bb.tt = _tt;
					bb.rr = _t + i;
					bb.sin_k = (s == 0) ? 4328534 : 432585341;
					bb.at = attack_time;
					Anim_Create(bb,"speed",0,0,bb.speed,-bb.speed,_dur);
					with(bb){
						custom_function = method(id, function(){
							tt -= 1;
							if(tt = 0){
								direction = lerp(-30,-150,Hash01(at*sin_k));
								Anim_Create(id,"speed",0,0,0,5,20);
								gravity = 0.1;
							}
						});
					}
				}
			}
		});

		// 第 60 帧刷新瞄准点与本体动作（须在大弹回调之前注册，保证同帧先执行）
		At(60, function(){
			tx = Player_GetPos()[0];
			ty = Player_GetPos()[1];
			mark.SetSequence(seq_enemy_boss_mini_og3_attack_2);
			side = 0;
		});

		// 大弹：第 60,80,...,160 帧，左右交替，命中/到期后炸成 4 发反弹弹
		During(60, 180, 20, function(_idx, _t){
			side = !side;
			var _pxs = [ x - 80 + side*160, x + 170 - side*340 ];
			var _pys = [ y + 120, y + 60 ];
			var bb, sb;
			for(var j = 0; j < 2; j++){
				bb = MakeEnemyBullet(_pxs[j], _pys[j], bullet_enemy_normal, spr_bullet_enemy_bug);
				bb.direction = point_direction(bb.x,bb.y,tx,ty);
				bb.image_angle = bb.direction;
				bb.speed = 10;
				bb.duration = 30;
				bb.image_xscale = 2;
				bb.image_yscale = 2;
				bb.auto_destroy_delay = 1;
				with(bb){
					custom_function = method(id, function(){
						if(duration = 1){
							for(var m = 0; m < 4; m++){
								sb = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_bug);
								sb.direction = direction + m*90;
								sb.image_angle = sb.direction;
								sb.speed = 7;
								sb.img = 0;
								sb.bounced = false;
								with(sb){
									custom_function = method(id, function(){
										img += 1;
										if(img mod 6 = 0)image_index = !image_index;
										if(bounced = false){
											if(x <= 0 || x >= room_width){
												if(x <= 0)x = abs(x);
												if(x >= room_width)x = room_width-(x-room_width);
												hspeed *= -1;
												bounced = true;
												image_angle = direction;
											}
											else if(y <= 0 || y >= room_height){
												if(y <= 0)y = abs(y);
												if(y >= room_height)y = room_height-(y-room_height);
												vspeed *= -1;
												bounced = true;
												image_angle = direction;
											}
										}
									});
								}
							}
						}
					});
				}
			}
		});

		At(210, function(){ mark.SetSequence(seq_enemy_boss_mini_og3_attack_2_outro); });
		At(330, function(){
			mark.SetMoveEnabled(true);
			end_attack();
		});
	}
}
	
attack_4 = function(){//下落加两轮旋转折返扩散
	live_name = "emitter_boss_xenomorph:attack_4";
	live;
	if(attack_time = 1){
		During(1,120,10,function(){
			mark.SetSequence(seq_enemy_boss_mini_og3_attack_0);
		});
		During(1,120,5,function(idx,tt){
			for(i=0;i<lerp(2,4,Hash01(tt*123));i+=1){
				dd = -90 + lerp(-60,60,Hash01(tt+i*120));
				bb = MakeEnemyBullet(x,y+80,bullet_enemy_normal,spr_bullet_enemy_normal_3);
				bb.direction = dd;
				bb.speed = 10;
				Anim_Create(bb,"direction",0,0,0,-90,0,40);
				Anim_Create(bb,"speed",0,0,0,15,30,40);
				Anim_Create(bb,"image_xscale",0,0,1,1,120);
				Anim_Create(bb,"image_yscale",0,0,1,1,120);
			}
		});
		During(90,120,6,function(idx){
			for(i=0;i<20;i+=1){
				bb = MakeEnemyBullet(540,500,bullet_enemy_normal);
				bb.image_index = 3;
				bb.x += lengthdir_x(80,18*i);
				bb.y += lengthdir_y(80,18*i);
				bb.direction = 18*i;
				bb.speed = -1;
				bb.auto_destroy = false;
				bb.duration = 900;
				Anim_Create(bb,"image_xscale",0,0,1,(4-idx)/1.5,90,30);
				Anim_Create(bb,"image_yscale",0,0,1,(4-idx)/1.5,90,30);
				Anim_Create(bb,"speed",0,0,bb.speed,20,15,30);
				Anim_Create(bb,"speed",0,0,bb.speed+15,8,20,200);
				Anim_Create(bb,"direction",0,0,bb.direction,-360,150,30);
			}
		});
		During(120,150,6,function(idx){
			for(i=0;i<20;i+=1){
				bb = MakeEnemyBullet(200,500,bullet_enemy_normal);
				bb.image_index = 3;
				bb.x += lengthdir_x(80,18*i);
				bb.y += lengthdir_y(80,18*i);
				bb.direction = 18*i;
				bb.speed = -1;
				bb.auto_destroy = false;
				bb.duration = 900;
				Anim_Create(bb,"image_xscale",0,0,1,(4-idx)/1.5,90,30);
				Anim_Create(bb,"image_yscale",0,0,1,(4-idx)/1.5,90,30);
				Anim_Create(bb,"speed",0,0,bb.speed,20,15,30);
				Anim_Create(bb,"speed",0,0,bb.speed+20,8,20,200);
				Anim_Create(bb,"direction",0,0,bb.direction,360,150,30);
			}
		});
	}
	if(attack_time = 150){
		mark.SetIdle();
	}
	if(attack_time = 330){
		end_attack();
	}	
}
	
attack_5 = function(){
	live_name = "emitter_boss_xenomorph:attack_5";
	live;
	
}

a0 = create_attack(0,attack_0,40)
a1 = create_attack(1,attack_1,40)
a2 = create_attack(2,attack_2,40,0.7)
a3 = create_attack(2,attack_3,40,0.9)
a4 = create_attack(3,attack_4,40)
a5 = create_attack(4,attack_5,40)
/*a6 = create_attack(5,attack_6,40)*/

//fixed_sequence = [a5]
random_pool = [a0,a1,a2,a3,a4]