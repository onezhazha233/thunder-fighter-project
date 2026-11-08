//live;
event_inherited();

attack_0 = function(){//收缩瞄准散射
	live_name = "emitter_boss_xenomorph:attack_0";
	live;
	if(attack_time = 1){
		rr = 240;
		Anim_Create(id,"rr",0,0,rr,10-rr,90);
		var _pgp = Player_GetPos();
		var _tx = instance_exists(player) ? _pgp[0] : mouse_x;
		var _ty = instance_exists(player) ? _pgp[1] : mouse_y;
		dd = point_direction(x,y+80,_tx,_ty);
		mark.SetMoveEnabled(false);
	}
	if(attack_time > 1&&attack_time < 100){
		if(attack_time mod 10 = 0){
			mark.SetSequence(seq_enemy_boss_mini_og3_attack_0);
			for(i=0;i<9;i+=1){
				bb = MakeEnemyBullet(x,y+80,bullet_enemy_normal);
				bb.direction = dd-4*(rr/9)+i*(rr/9);
				bb.speed = 3;
				bb.image_xscale = 2;
				bb.image_yscale = 2;
				Anim_Create(bb,"speed",0,0,3,10,20,40);
			}
		}
	}
	if(attack_time = 140){
		mark.SetMoveEnabled(true);
		end_attack();
	}
}
	
attack_1 = function(){//八向反弹加曲线狙
	live_name = "emitter_boss_xenomorph:attack_1";
	live;
	if(attack_time <= 2 || !variable_instance_exists(id,"tx")){
		var _pgp = Player_GetPos();
		tx = instance_exists(player) ? _pgp[0] : mouse_x;
		ty = instance_exists(player) ? _pgp[1] : mouse_y;
	}
	if(attack_time > 1&&attack_time < 300){
		if(attack_time mod 6 = 0){
			for(i=0;i<8;i+=(attack_time < 100)+1){
				dd = i*45+22.5;
				bb = MakeEnemyBullet(x+lengthdir_x(80,dd),y+lengthdir_y(80,dd),bullet_enemy_normal);
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
		}
	}
	if(attack_time > 1&&attack_time < 300){
		if(attack_time mod 40 < 25){
			if(attack_time mod 40 = 0){
				mark.SetSequence(seq_enemy_boss_mini_og3_attack_0);
			}
			if(attack_time mod 40 = 10){
				mark.SetSequence(seq_enemy_boss_mini_og3_attack_0);
			}
			if(attack_time mod 40 = 20){
				mark.SetSequence(seq_enemy_boss_mini_og3_attack_0);
			}
			if(attack_time mod 40 = 0){
				var _pgp = Player_GetPos();
				tx = instance_exists(player) ? _pgp[0] : mouse_x;
				ty = instance_exists(player) ? _pgp[1] : mouse_y;
			}
			if(attack_time mod 3 = 0){
				var _side = ((attack_time div 40) mod 2 == 0) ? 1 : -1;
				for(var k=0;k<2;k+=1){
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

						custom_function = function(){
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
						}
					}
				}
			}
		}
	}
	if(attack_time = 350){
		end_attack();
	}
}
	
attack_2 = function(){//左右下落加激光
	live_name = "emitter_boss_xenomorph:attack_2";
	live;
	if(attack_time = 1){
		l0 = MakeEnemyLaser(1,x,y+80,1,-90,60,60);
		l1 = noone;
		l2 = noone;
		l3 = noone;
		l4 = noone;
	}
	if(attack_time = 90){
		l1 = MakeEnemyLaser(1,x-55,y+130,1,-90,60,60);
		l2 = MakeEnemyLaser(1,x+55,y+130,1,-90,60,60);
	}
	if(attack_time = 180){
		l3 = MakeEnemyLaser(1,x-95,y+85,1,-90,60,30);
		l4 = MakeEnemyLaser(1,x+95,y+85,1,-90,60,30);
	}
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
	if(attack_time > 1&&attack_time < 30||attack_time > 60&&attack_time < 90||attack_time > 120&&attack_time < 150||attack_time > 180&&attack_time < 210){
		if(attack_time mod 10 = 1){
			mark.SetSequence(seq_enemy_boss_mini_og3_attack_1_0);
		}
		if(attack_time mod 4 = 0){
			for(i=0;i<7;i+=1){
				bb = MakeEnemyBullet(x-60,y-115,bullet_enemy_normal,spr_bullet_enemy_normal_1);
				bb.hspeed = -3*2+i*2+2;
				if(attack_time mod 12 = 0){
					bb.hspeed *= 1.5;
					bb.vspeed -= 2;
				}
				bb.vspeed = -10;
				bb.gravity = 0.5;
				bb.image_angle = 90;
				with(bb){
					px = x;
					py = y;
					custom_function = function(){
						image_angle = point_direction(px,py,x,y);
						px = x;
						py = y;
					}
				}
			}
		}
	}
	if(attack_time > 30&&attack_time < 60||attack_time > 90&&attack_time < 120||attack_time > 150&&attack_time < 180||attack_time > 210&&attack_time < 240){
		if(attack_time mod 10 = 1){
			mark.SetSequence(seq_enemy_boss_mini_og3_attack_1_1);
		}
		if(attack_time mod 4 = 0){
			for(i=0;i<7;i+=1){
				bb = MakeEnemyBullet(x+60,y-115,bullet_enemy_normal,spr_bullet_enemy_normal_1);
				bb.hspeed = -3*2+i*2-2;
				if(attack_time mod 12 = 0){
					bb.hspeed *= 1.5;
					bb.vspeed -= 2;
				}
				bb.vspeed = -10;
				bb.gravity = 0.5;
				bb.image_angle = 90;
				with(bb){
					px = x;
					py = y;
					custom_function = function(){
						image_angle = point_direction(px,py,x,y);
						px = x;
						py = y;
					}
				}
			}
		}
	}
	if(attack_time = 300){
		end_attack();
	}
}
	
attack_3 = function(){//散射下落加扩散反弹狙
	live_name = "emitter_boss_xenomorph:attack_3";
	live;
	if(attack_time = 1){
		mark.SetMoveEnabled(false);
		mark.SetSequence(seq_enemy_boss_mini_og3_attack_2_intro);
	}
	if(attack_time > 30&&attack_time < 90){
		if(attack_time mod 20 = 1){
			for(i=0;i<9;i+=1){
				xx = x - (4-i)*30;
				yy = y + abs(4-i)*30-140-30;
				bb = MakeEnemyBullet(xx,yy,bullet_enemy_normal);
				bb.image_index = 4;
				bb.direction = point_direction(x,y-30,bb.x,bb.y);
				bb.speed = 6;
				bb.tt = 40-((attack_time-50)) + i*10;
				bb.rr = attack_time+i;
				Anim_Create(bb,"speed",0,0,bb.speed,-bb.speed,40-((attack_time-50)));
				with(bb){
					custom_function = function(){
						tt -= 1;
						if(tt = 0){
							direction = lerp(-30,-150,abs(sin(rr*4328534)));
							Anim_Create(id,"speed",0,0,0,5,20);
							gravity = 0.1;
						}
					}
				}
				xx = x - (4-i)*30;
				yy = y - abs(4-i)*30+140-30;
				bb = MakeEnemyBullet(xx,yy,bullet_enemy_normal);
				bb.image_index = 4;
				bb.direction = point_direction(x,y-30,bb.x,bb.y);
				bb.speed = 6;
				bb.tt = 40-((attack_time-50)) + i*10;
				bb.rr = attack_time+i;
				Anim_Create(bb,"speed",0,0,bb.speed,-bb.speed,40-((attack_time-50)));
				with(bb){
					custom_function = function(){
						tt -= 1;
						if(tt = 0){
							direction = lerp(-30,-150,abs(sin(rr*432585341)));
							Anim_Create(id,"speed",0,0,0,5,20);
							gravity = 0.1;
						}
					}
				}
			}
		}
	}
	if(attack_time > 90&&attack_time < 150){
		if(attack_time mod 20 = 1){
			for(i=0;i<9;i+=1){
				xx = x - (4-i)*30;
				yy = y + abs(4-i)*30-140-30;
				bb = MakeEnemyBullet(xx,yy,bullet_enemy_normal);
				bb.image_index = 4;
				bb.direction = point_direction(x,y-30,bb.x,bb.y);
				bb.speed = 6;
				bb.tt = 40-((attack_time-110)) + (8-i)*10;
				bb.rr = attack_time+i;
				Anim_Create(bb,"speed",0,0,bb.speed,-bb.speed,40-((attack_time-110)));
				with(bb){
					custom_function = function(){
						tt -= 1;
						if(tt = 0){
							direction = lerp(-30,-150,abs(sin(rr*4328534)));
							Anim_Create(id,"speed",0,0,0,5,20);
							gravity = 0.1;
						}
					}
				}
				xx = x - (4-i)*30;
				yy = y - abs(4-i)*30+140-30;
				bb = MakeEnemyBullet(xx,yy,bullet_enemy_normal);
				bb.image_index = 4;
				bb.direction = point_direction(x,y-30,bb.x,bb.y);
				bb.speed = 6;
				bb.tt = 40-((attack_time-110)) + (8-i)*10;
				bb.rr = attack_time+i;
				Anim_Create(bb,"speed",0,0,bb.speed,-bb.speed,40-((attack_time-110)));
				with(bb){
					custom_function = function(){
						tt -= 1;
						if(tt = 0){
							direction = lerp(-30,-150,abs(sin(rr*432585341)));
							Anim_Create(id,"speed",0,0,0,5,20);
							gravity = 0.1;
						}
					}
				}
			}
		}
	}
	if(attack_time >= 60&&attack_time < 180){
		if(attack_time = 60){
			var _pgp = Player_GetPos();
			tx = instance_exists(player) ? _pgp[0] : mouse_x;
			ty = instance_exists(player) ? _pgp[1] : mouse_y;
			mark.SetSequence(seq_enemy_boss_mini_og3_attack_2);
			side = 0;
		}
		if(attack_time mod 20 = 0){
			side = !side;
			bb = MakeEnemyBullet(x-80+(side*160),y+120,bullet_enemy_normal,spr_bullet_enemy_bug);
			bb.direction = point_direction(bb.x,bb.y,tx,ty);
			bb.image_angle = bb.direction;
			bb.speed = 10;
			bb.duration = 30;
			bb.image_xscale = 2;
			bb.image_yscale = 2;
			bb.auto_destroy_delay = 1;
			with(bb){
				custom_function = function(){
					if(duration = 1){
						for(i=0;i<4;i+=1){
							bb = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_bug);
							bb.direction = direction + i*90;
							bb.image_angle = bb.direction;
							bb.speed = 7;
							bb.img = 0;
							bb.bounced = false;
							with(bb){
								custom_function = function(){
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
								}
							}
						}
					}
				}
			}
			bb = MakeEnemyBullet(x+170-(side*340),y+60,bullet_enemy_normal,spr_bullet_enemy_bug);
			bb.direction = point_direction(bb.x,bb.y,tx,ty);
			bb.image_angle = bb.direction;
			bb.speed = 10;
			bb.duration = 30;
			bb.image_xscale = 2;
			bb.image_yscale = 2;
			bb.auto_destroy_delay = 1;
			with(bb){
				custom_function = function(){
					if(duration = 1){
						for(i=0;i<4;i+=1){
							bb = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_bug);
							bb.direction = direction + i*90;
							bb.image_angle = bb.direction;
							bb.speed = 7;
							bb.img = 0;
							bb.bounced = false;
							with(bb){
								custom_function = function(){
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
								}
							}
						}
					}
				}
			}
		}
	}
	if(attack_time = 210){
		mark.SetSequence(seq_enemy_boss_mini_og3_attack_2_outro);
	}
	if(attack_time = 330){
		mark.SetMoveEnabled(true);
		end_attack();
	}
}
	
attack_4 = function(){
	live_name = "emitter_boss_xenomorph:attack_4";
	live;
	
}

a0 = create_attack(0,attack_0,40)
a1 = create_attack(1,attack_1,40)
a2 = create_attack(2,attack_2,40,0.7)
a3 = create_attack(2,attack_3,40,0.9)
a4 = create_attack(3,attack_4,40)
/*a5 = create_attack(4,attack_5,40)
a6 = create_attack(5,attack_6,40)*/

//fixed_sequence = [a3]
random_pool = [a0,a1,a2,a3]