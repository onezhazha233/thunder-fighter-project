//live;
event_inherited();

// 获取目标位置的方向
attack_0_get_target_dir = function(){
	var _tx = instance_exists(player) ? player.x : mouse_x;
	var _ty = instance_exists(player) ? player.y : mouse_y;
	return point_direction(x, y-62, _tx, _ty);
}

// 创建追踪子弹
attack_0_create_homing_bullet = function(_dir){
	var _blt = MakeEnemyBullet(x, y-62, bullet_enemy_normal, spr_bullet_enemy_normal_0);
	_blt.duration = 60;
	_blt.direction = _dir;
	with(_blt){
		custom_function = function(){
			if(duration == 1){
				duration = -1;
				speed = 10;
			}
		}
	}
}

// 创建环形弹幕
attack_0_create_ring_bullet = function(_dir, _number, _size,xx,yy){
	var _blt = MakeEnemyBullet(xx, yy-62, bullet_enemy_ring);
	_blt.number = _number;
	_blt.rott = _dir;
	_blt.duration = 60;
	_blt.direction = _dir;
	_blt.size = _size;
	with(_blt){
		image_angle = 360/number;
		for(var i=0; i<number; i+=1){
			blt[i] = MakeEnemyBullet(x+lengthdir_x(size, image_angle*i+rott), y+lengthdir_y(size, image_angle*i+rott), bullet_enemy_normal, spr_bullet_enemy_normal_0);
		}
		enabled = true;
		custom_function = function(){
			if(duration == 1){
				duration = -1;
				Anim_Create(id, "size", 0, 0, size, -size*0.5, 60);
				speed = 10;
				rot = 6;
			}
		}
	}
}

// 处理单轮攻击
attack_0_process_phase = function(_phase){
	var _phase_start = _phase.start;
	var _bullet_count = _phase.count;
	var _phase_end = _phase_start + 20;  // 每轮持续20帧
	
	if(attack_time >= _phase_start && attack_time < _phase_end){
		var _tt = attack_time - _phase_start;
		if(_tt mod 3 == 0){
			var _cycle = _tt div 3;
			if(_cycle == 0){
				// 每轮第一个子弹时获取角度
				_phase.dir = attack_0_get_target_dir();
				attack_0_create_homing_bullet(_phase.dir);
				xx = x;
				yy = y;
			} else {
				// 确保方向已设置后才创建环形弹幕
				if(variable_instance_exists(_phase, "dir")){
					attack_0_create_ring_bullet(_phase.dir, _bullet_count, _cycle * 30,xx,yy);
				}
			}
		}
	}
}

attack_0 = function(){//螺旋延迟狙
	live_name = "emitter_boss_sirius_twins_0:attack_0";
	live;
	if(attack_time = 1){
		mark.SetSequence(seq_enemy_boss_mini_og1_0_attack);
		attack_0_phases = [
			{ start: 1, count: 3 },
			{ start: 20, count: 4 },
			{ start: 40, count: 5 },
			{ start: 60, count: 6 }
		];
	}
	for(var i=0; i<array_length(attack_0_phases); i+=1){
		attack_0_process_phase(attack_0_phases[i]);
	}
	if(attack_time = 80){
		mark.SetIdle();
	}
	if(attack_time = 200){
		end_attack();
	}
}

attack_1 = function(){//狙加摆动散射
	live_name = "emitter_boss_sirius_twins_0:attack_1";
	live;
	if(attack_time <= 48){
		if(attack_time mod 3 = 1){
			var _tx = instance_exists(player) ? player.x : mouse_x;
			var _ty = instance_exists(player) ? player.y : mouse_y;
			if(attack_time mod 12 = 1){
				dd0 =  point_direction(x-80,y+40, _tx, _ty);
				dd1 =  point_direction(x+80,y+40, _tx, _ty);
				dd2 =  point_direction(x-27,y+110, _tx, _ty);
				dd3 =  point_direction(x+27,y+110, _tx, _ty);
			}
			blt = MakeEnemyBullet(x-80,y+40,bullet_enemy_normal,spr_bullet_enemy_normal_1);
			blt.direction = dd0;
			blt.image_angle = dd0;
			blt.speed = 12;
			blt = MakeEnemyBullet(x+80,y+40,bullet_enemy_normal,spr_bullet_enemy_normal_1);
			blt.direction = dd1;
			blt.image_angle = dd1;
			blt.speed = 12;
			blt = MakeEnemyBullet(x-27,y+110,bullet_enemy_normal,spr_bullet_enemy_normal_1);
			blt.direction = dd2;
			blt.image_angle = dd2;
			blt.speed = 12;
			blt = MakeEnemyBullet(x+27,y+110,bullet_enemy_normal,spr_bullet_enemy_normal_1);
			blt.direction = dd3;
			blt.image_angle = dd3;
			blt.speed = 12;
		}
	}
	if(attack_time >= 60&&attack_time < 110){
		if(attack_time = 60){
			dd = -90+40;
			Anim_Create(id,"dd",0,0,-90+40,-80,10);
			Anim_Create(id,"dd",0,0,-90-40,80,10,10);
			Anim_Create(id,"dd",0,0,-90+40,-80,10,20);
			Anim_Create(id,"dd",0,0,-90-40,80,10,30);
			Anim_Create(id,"dd",0,0,-90+40,-80,10,40);
			Anim_Create(id,"dd",0,0,-90-40,80,10,50);
		}
		blt = MakeEnemyBullet(x,y+60,bullet_enemy_normal,spr_bullet_enemy_normal_0);
		blt.direction = dd;
		blt.image_angle = dd;
		blt.speed = 10 - (attack_time/60);
	}
	if(attack_time = 200){
		end_attack();
	}
}

attack_2 = function(){//延迟蓝针狙
	live_name = "emitter_boss_sirius_twins_0:attack_2";
	live;
	if(attack_time <= 40&&attack_time mod 4 = 0){
		for(i=0;i<8;i+=1){
			blt = MakeEnemyBullet(x,y-62,bullet_enemy_normal,spr_bullet_enemy_blueneedle);
			blt.image_angle = -attack_time*3 + i*45;
			blt.direction = -attack_time*3 + i*45;
			Anim_Create(blt,"speed",0,0,10,-9.9,30);
			Anim_Create(blt,"image_xscale",0,0,1,-0.9,30);
			blt.duration = 90;
			with(blt){
				custom_function = function(){
					if(duration = 1){
						duration = -1;
						Anim_Create(id,"image_xscale",0,0,0.1,1.4,10);
						var _tx = instance_exists(player) ? player.x : mouse_x;
						var _ty = instance_exists(player) ? player.y : mouse_y;
						direction = point_direction(x,y,_tx,_ty);
						image_angle = direction;
						Anim_Create(id,"speed",0,0,0.1,20,30);
					}
				}
			}
		}
	}
	if(attack_time = 200){
		end_attack();
	}
}

attack_3 = function(){//两次分裂
	live_name = "emitter_boss_sirius_twins_0:attack_3";
	live;
	if(attack_time = 1){
		mark.SetSequence(seq_enemy_boss_mini_og1_0_attack);
		mark.SetMoveEnabled(false);
	}
	if(attack_time < 20){
		if(attack_time mod 4 = 1){
			blt = MakeEnemyBullet(x,y+80,bullet_enemy_normal,spr_bullet_enemy_normal_0);
			blt.image_index = 3;
			blt.direction = -90;
			blt.speed = 6;
			blt.duration = 30;
			with(blt){
				custom_function = function(){
					if(duration = 1){
						for(i=0;i<4;i+=1){
							blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_0);
							blt.image_index = 3;
							blt.direction = -90-30+i*20;
							blt.speed = 8 - (i!=1&&i!=2)*2;
							blt.duration = 30;
							with(blt){
								custom_function = function(){
									if(duration = 1){
										for(i=0;i<3;i+=1){
											blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_0);
											blt.image_index = 3;
											blt.direction = direction-10+i*10;
											blt.speed = 10 + (i!=1)*3;
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
	if(attack_time = 40){
		mark.SetIdle();
		mark.SetMoveEnabled(true);
	}
	if(attack_time = 150){
		end_attack();
	}
}

attack_4 = function(){//反弹子弹排
	live_name = "emitter_boss_sirius_twins_0:attack_4";
	live;
	if(attack_time = 1){
		mark.SetSequence(seq_enemy_boss_mini_og1_0_attack);
		mark.SetMoveEnabled(false);
		for(j=0;j<2;j+=1){
			for(i=0;i<6;i+=1){
				blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.image_index = 1;
				blt.bounced = 0;
				Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.y,-30*2.5+i*30,20,20);
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,20);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,20);
				Anim_Create(blt,"hspeed",0,0,0,5*(j=0 ? 1 : -1),0,40);
				Anim_Create(blt,"vspeed",0,0,0,5*(j=0 ? 1 : -1),0,40);
				blt.edge = [20,30*i+10,30*(5-i)+10];
				with(blt){
					custom_function = function(){
						if(bounced < 4){
							if(x <= 0+edge[0] || x >= room_width-edge[0]){
								if(x <= 0+edge[0])x = 0+edge[0];
								if(x >= room_width-edge[0])x = room_width-edge[0];
								hspeed *= -1;
								bounced += 1;
							}
							if(y <= 0+edge[1] || y >= room_height-edge[2]){
								if(y <= 0+edge[1])y = 0+edge[1];
								if(y >= room_height-edge[2])y = room_height-edge[2];
								vspeed *= -1;
								bounced += 1;
							}
						}
					}
				}
			}
		}
	}
	if(attack_time = 40){
		for(j=0;j<2;j+=1){
			for(i=0;i<6;i+=1){
				blt = MakeEnemyBullet(x,y,bullet_enemy_normal,spr_bullet_enemy_normal_0);
				blt.image_index = 0;
				blt.bounced = 0;
				Anim_Create(blt,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,blt.y,-30*2.5+i*30,20,20);
				Anim_Create(blt,"image_xscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,20);
				Anim_Create(blt,"image_yscale",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1.5,20);
				Anim_Create(blt,"hspeed",0,0,0,5*(j=0 ? 1 : -1),0,40);
				Anim_Create(blt,"vspeed",0,0,0,-5*(j=0 ? 1 : -1),0,40);
				blt.edge = [20,30*i+10,30*(5-i)+10];
				with(blt){
					custom_function = function(){
						if(bounced < 4){
							if(x <= 0+edge[0] || x >= room_width-edge[0]){
								if(x <= 0+edge[0])x = 0+edge[0];
								if(x >= room_width-edge[0])x = room_width-edge[0];
								hspeed *= -1;
								bounced += 1;
							}
							if(y <= 0+edge[1] || y >= room_height-edge[2]){
								if(y <= 0+edge[1])y = 0+edge[1];
								if(y >= room_height-edge[2])y = room_height-edge[2];
								vspeed *= -1;
								bounced += 1;
							}
						}
					}
				}
			}
		}
	}
	if(attack_time = 90){
		mark.SetIdle();
		mark.SetMoveEnabled(true);
	}
	if(attack_time = 150){
		end_attack();
	}
}

a0 = create_attack(0,attack_0,30)
a1 = create_attack(1,attack_1,40)
a2 = create_attack(2,attack_2,30)
a3 = create_attack(3,attack_3,40)
a4 = create_attack(4,attack_4,30)

fixed_sequence = [a1,a0,a3,a2,a4]
random_pool = [a0,a1,a2,a3,a4]